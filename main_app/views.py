from django.shortcuts import render, get_object_or_404, redirect
from django.template.loader import render_to_string
from django.contrib.auth.decorators import login_required
from django.http import JsonResponse, HttpResponse, HttpResponseRedirect
from django.urls import reverse
from django.core.files import File
from django.views.decorators.csrf import csrf_exempt
from .models import Deal, Dispensary, Review, DealImage, Coupon, Order
from django.contrib.auth.models import User
from .forms import SearchForm, ReviewForm, CreateDealForm, ImageUploadForm, SelectAmountForm
from django.contrib.staticfiles.templatetags.staticfiles import static
from django.core.files.uploadedfile import InMemoryUploadedFile
from .decorators import is_dispensary
from django.contrib.staticfiles.templatetags.staticfiles import static
from datetime import date
from django.conf.global_settings import MEDIA_ROOT
from io import StringIO, BytesIO
import geocoder
import qrcode
import sys, os
from klip.settings import BASE_DIR, STATIC_ROOT
import facebook
import urllib
from urllib.parse import urlparse, parse_qs, urlencode
import urllib
import subprocess
import warnings
import json
from django.core.urlresolvers import resolve

import gspread
from oauth2client.service_account import ServiceAccountCredentials

from paypal.standard.forms import PayPalPaymentsForm

from paypal.standard.models import ST_PP_COMPLETED
from paypal.standard.ipn.signals import valid_ipn_received
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

    if date.today() <= _deal.date_expires:
        review_form = ReviewForm()

        context = dict()
        context['deal'] = _deal
        formatted_date = _deal.date_expires.strftime('%Y/%m/%d')
        context['review_form'] = review_form
        context['form'] = form
        context['expires'] = formatted_date

        return render(request, 'main_app/deal.html', context)

    else:
        _deal.status = _deal.INACTIVE
        return HttpResponseRedirect(reverse('index'))


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
    if request.method == 'GET':
        challenge = request.GET["hub.challenge"]
        verify_token = request.GET["hub.verify_token"]
        if verify_token == 'abc123':
            print('Goodbye, cruel world!')
            return HttpResponse(challenge)

    if request.method == 'POST':

        body_unicode = request.body.decode('utf-8')
        body = json.loads(body_unicode)
        content = body['entry'][0]['changes'][0]['value']['leadgen_id']
        print(content)

        # Hide deprecation warnings. The facebook module isn't that up-to-date (facebook.GraphAPIError).
        graph = facebook.GraphAPI(access_token='EAAGmXNUv8QQBAI69nWIAtD4bZCPxYF7Pl2PjQX5rhVyjVJdVXMZAAQrsFHb2z7suhi5oCwIhC8IIYbfw5rZANtYnhmb8ZB7xsmZBRDGK56FQglgmh7UqFsxuXwEfwv8wMXbSBGv05ZCaARELbZAuxKuAO01is4wMuodP2w3fDPO3QZDZD', version='2.1')
        post = graph.get_object(id=content)
        created_time = post['created_time']
        name = post['field_data'][1]['values'][0]
        phone_number = post['field_data'][0]['values'][0]

        print('time: ' + created_time)
        print('name: ' + name)
        print('phone_number: ' + phone_number)

        scope = ['https://spreadsheets.google.com/feeds']

        local_file_path = '{0}/{1}/{2}'.format(resolve(request.path).app_name, 'static', 'client_secret.json')
        global_file_path = os.path.join(BASE_DIR, local_file_path)

        creds = ServiceAccountCredentials.from_json_keyfile_name(STATIC_ROOT+'/client_secret.json', scope)
        client = gspread.authorize(creds)

        sheet = client.open('New').sheet1

        sheet.append_row([created_time, name, phone_number])

        return HttpResponse({'status': 'OK'})


def payment_success(request):
    return render(request, 'main_app/payment_success.html')


def payment_cancel(request):
    return render(request, 'main_app/payment_cancel.html')


@is_dispensary
def select_amount_view(request):
    user = request.user
    if request.method == 'POST':
        form = SelectAmountForm(request.POST)
        if form.is_valid():
            order = Order(dispensary=user.profile.dispensary, amount=form.cleaned_data['amount'])
            order.save()
            return HttpResponseRedirect(reverse('payment_view', args=[str(order.id)]))
        else:
            return JsonResponse({'status': 'Ooops! Something went wrong...'})
    else:
        form = SelectAmountForm()
        return render(request, 'main_app/select_amount.html', {'form': form})


@is_dispensary
def payment_view(request, pk):

    order = get_object_or_404(Order, pk=pk)
    # What you want the button to do.
    paypal_dict = {
        "business": "nanlicawork-facilitator@gmail.com",
        "amount": order.amount,
        "item_name": 'Dispensary balance',
        "invoice": order.id,
        "notify_url": request.build_absolute_uri(reverse('paypal-ipn')),
        "return_url": request.build_absolute_uri(reverse('payment_success')),
        "cancel_return": request.build_absolute_uri(reverse('payment_cancel')),
        "custom": request.user.id,  # Custom command to correlate to some function later (optional)
    }

    # Create the instance.
    form = PayPalPaymentsForm(initial=paypal_dict)
    context = {"form": form}
    return render(request, "main_app/payment.html", context)


def show_me_the_money(sender, **kwargs):
    ipn_obj = sender
    print("GO!")
    if ipn_obj.payment_status == ST_PP_COMPLETED:
        print('GOGO!')
        # WARNING !
        # Check that the receiver email is the same we previously
        # set on the `business` field. (The user could tamper with
        # that fields on the payment form before it goes to PayPal)
        if ipn_obj.receiver_email != "nanlicawork-facilitator@gmail.com":
            # Not a valid payment
            return

        # ALSO: for the same reason, you need to check the amount
        # received, `custom` etc. are all what you expect or what
        # is allowed.

        # Undertake some action depending upon `ipn_obj`.
        user = User.objects.filter(id=ipn_obj.custom).first()
        user.profile.balance += ipn_obj.mc_gross
        user.save()
        print('GOGOGO!')
    else:
        return

valid_ipn_received.connect(show_me_the_money)