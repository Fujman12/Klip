from django.shortcuts import render, get_object_or_404, redirect
from django.template.loader import render_to_string
from django.contrib.auth.decorators import login_required
from django.http import JsonResponse, HttpResponse
from django.urls import reverse
from django.core.files import File
from django.views.decorators.csrf import csrf_exempt
from .models import Deal, Dispensary, Review, DealImage, Coupon
from .forms import SearchForm, ReviewForm, CreateDealForm, ImageUploadForm
from django.contrib.staticfiles.templatetags.staticfiles import static
from django.core.files.uploadedfile import InMemoryUploadedFile
from .decorators import is_dispensary
from django.contrib.staticfiles.templatetags.staticfiles import static
from django.conf.global_settings import MEDIA_ROOT
from io import StringIO, BytesIO
import geocoder
import qrcode
import sys
# Create your views here.


def e_handler404(request):

    form = SearchForm()
    context = dict()
    context['form'] = form

    response = render(request, 'main_app/404.html', context)
    response.status_code = 404
    return response


def e_handler500(request):

    form = SearchForm()
    context = dict()
    context['form'] = form

    response = render(request, 'main_app/404.html', context)
    response.status_code = 500
    return response


def index(request):

    form = SearchForm()
    context = dict()
    context['form'] = form

    return render(request, 'main_app/index.html', context)


def contact_us(request):

    form = SearchForm()
    context = dict()
    context['form'] = form

    return render(request, 'main_app/contact_us.html', context)


def about_us(request):

    form = SearchForm()
    context = dict()
    context['form'] = form

    return render(request, 'main_app/about_us.html', context)


@csrf_exempt
def deals_around(request):
    location = request.POST['location']
    g = geocoder.google(location)

    deals = []
    for dispensary in Dispensary.objects.raw("SELECT main_app_dispensary.id, ( 3959 * acos( cos( radians({}) ) * cos( radians( lat ) ) * cos( radians( lng ) - radians({}) ) + sin( radians({}) ) * sin( radians( lat ) ) ) ) "
                                             "AS distance FROM main_app_dispensary JOIN main_app_location ON main_app_dispensary.location_id=main_app_location.id GROUP BY id HAVING distance < 25 ORDER BY distance LIMIT 0 , 20;".format(g.lat, g.lng, g.lat)):
        print(dispensary)
        for deal in dispensary.deals.all():
            if deal.status == deal.ACTIVE:

                if deal.dispensary.profile is not None and deal.dispensary.profile.avatar is not None:
                    image_url = deal.dispensary.profile.avatar.url
                else:
                    image_url = static('main_app/images/deals/thumb_02.jpg')

                deals.append({'title': deal.title, 'description': deal.description, 'price': deal.price,
                              'expires': deal.date_expires, 'lat': deal.dispensary.location.lat, 'lng': deal.dispensary.location.lng,
                              'deal_url': reverse('deal', args=[deal.pk]), 'image_url': static('main_app/images/deals/thumb_02.jpg'),
                              'dispensary': deal.dispensary.name, 'likes': deal.likes, 'dislikes': deal.dislikes,
                              'dispensary_city': deal.dispensary.location.city, 'dispensary_state': deal.dispensary.location.state,
                              'bought': deal.coupons.all().count(), 'image_url': image_url})
    print(deals)
    return JsonResponse({'deals': deals})


def map_view(request):

    context = dict()

    if request.method == 'POST':

        location = request.POST['location']

    else:

        location = 'New York'

    center = geocoder.google(location)
    context['location'] = location
    context['center'] = center

    form = SearchForm()
    context['form'] = form

    return render(request, 'main_app/map_view.html', context)


def deal(request, pk):

    form = SearchForm()

    _deal = get_object_or_404(Deal, pk=pk)

    review_form = ReviewForm()

    context = dict()
    context['deal'] = _deal
    formatted_date = _deal.date_expires.strftime('%Y/%m/%d')
    context['review_form'] = review_form
    context['form'] = form
    context['expires'] = formatted_date

    return render(request, 'main_app/deal.html', context)


# updates deal's likes/dislikes
def update_likes(request, pk):

    _deal = get_object_or_404(Deal, pk=pk)
    _deal.likes = request.POST['likes']
    _deal.dislikes = request.POST['dislikes']
    _deal.save()

    return JsonResponse({'status': True})


def post_review(request, pk):

    context = dict()

    if request.method == 'POST':
        form = ReviewForm(request.POST)

        if form.is_valid():
            context['form_is_valid'] = True
            review = form.save(commit=False)

            user = request.user
            review.user = user

            _deal = get_object_or_404(Deal, pk=pk)
            review.deal = _deal

            review.save()
            print(_deal.reviews.all().count())
            context['html_review_list'] = render_to_string('main_app/partial/review_list.html', {'deal': _deal})

        else:

            context['form_is_valid'] = False

    return JsonResponse(context)


@is_dispensary
def test(request):
    return JsonResponse({'status': True})


@is_dispensary
def create_deal(request):
    user = request.user
    if request.method == 'POST':
        form = CreateDealForm(request.POST)
        if form.is_valid():
            data = {'form_is_valid': True}
            deal = Deal(title=form.cleaned_data['title'], description=form.cleaned_data['description'], category=form.cleaned_data['status'],
                        price=form.cleaned_data['price'], old_price=form.cleaned_data['old_price'], date_starts=form.cleaned_data['date_start'],
                        date_expires=form.cleaned_data['date_end'], dispensary=user.profile.dispensary)
            deal.save()
            data['pk'] = deal.pk

            data['image_upload_form'] = render_to_string('main_app/partial/image_upload_form.html', {'deal': deal})
            return JsonResponse(data)
    return JsonResponse({'status': 'BAD request'})


@is_dispensary
def upload_deal_image(request, pk):
    _deal = get_object_or_404(Deal, pk=pk)
    if request.method == 'POST':

        print(request.FILES['file[0]'])
        file = request.FILES['file[0]']
        new_image = DealImage(image=file, deal=_deal)
        new_image.save()

        return JsonResponse({'status': True, 'id': new_image.id},)

    else:

        return JsonResponse({'status': False})


@is_dispensary
def deal_image_remove(request):
    if request.method == 'POST':
        id = request.POST['id']
        image = get_object_or_404(DealImage, pk=id)
        image.delete()
        print(id)
        return JsonResponse({'status': 'OK'})


@is_dispensary
def change_deal_status(request, pk):
    _deal = get_object_or_404(Deal, pk=pk)
    print('bla')
    if _deal.status != _deal.PENDING:
        if request.POST['checked'] == '1':
            _deal.status = Deal.ACTIVE
        elif request.POST['checked'] == '0':
            _deal.status = Deal.INACTIVE
        _deal.save()
        return JsonResponse({'status': 'OK'})
    return JsonResponse({'status': 'BAD request'})


def remove_deal(request, pk):
    _deal = get_object_or_404(Deal, pk=pk)
    _deal.delete()
    return JsonResponse({'status': 'OK'})


@login_required
def create_coupon(request, pk):
    user = request.user
    if user.profile.user_type != user.profile.DISPENSARY:

        _deal = get_object_or_404(Deal, pk=pk)
        coupon = Coupon(deal=_deal, user=user)
        coupon.save()

        url = request.build_absolute_uri(reverse(activation_attempt, args=[str(coupon.id)]))
        img = qrcode.make(url)

        buffer = BytesIO()
        img.save(buffer)
        filename = 'coupon-%s.png' % coupon.id
        filebuffer = InMemoryUploadedFile(buffer, None, filename, 'image/png', buffer, None)
        coupon.qr_image.save(filename, filebuffer)

        #coupon.qr_image = img
        #coupon.save()

    return render(request, 'main_app/claim_success.html')


def coupon_details(request, pk):
    coupon = get_object_or_404(Coupon, pk=pk)

    return render(request, 'main_app/coupon_details.html', {'coupon': coupon})


def patient_view(request, pk):
    if request.session.get('access', False):

        coupon = get_object_or_404(Coupon, pk=pk)
        if coupon.status == coupon.ACTIVE:
            coupon.status = coupon.USED
            coupon.save()
            return render(request, 'main_app/patient_view.html', {'coupon': coupon})
        else:
            return JsonResponse({'message': 'Sorry! Coupon is expired'})

    else:
        return redirect(reverse('activation_attempt', args=[str(pk)]))


def activation_attempt(request, pk):
    coupon = get_object_or_404(Coupon, pk=pk)

    if request.method == 'POST':
        secret = request.POST['secret']
        response = coupon.activation_auth(secret)
        if response:
            request.session['access'] = True
            return redirect(reverse('patient_view', args=[str(coupon.pk)]))

    return render(request, 'main_app/activation_attempt.html', {'pk': pk})


def remove_coupon(request, pk):

    coupon = get_object_or_404(Coupon, pk=pk)
    if request.user == coupon.user:
        coupon.delete()

    return JsonResponse({'status': 'OK'})


def webhook(request):
    challenge = request.GET["hub.challenge"]
    verify_token = request.GET["hub.verify_token"]
    if verify_token == 'abc123':
        print('Goodbye, cruel world!')
        return HttpResponse(challenge)

