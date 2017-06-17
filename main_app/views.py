from django.shortcuts import render, get_object_or_404
from django.template.loader import render_to_string
from django.contrib.auth.decorators import login_required
from django.http import JsonResponse, HttpResponse
from django.views.decorators.csrf import csrf_exempt
from .models import Deal, Dispensary, Review
from .forms import SearchForm, ReviewForm
import geocoder
# Create your views here.


def index(request):
    form = SearchForm()
    context = dict()
    context['form'] = form

    return render(request, 'main_app/index.html', context)


@csrf_exempt
def deals_around(request):
    location = request.POST['location']
    g = geocoder.google(location)

    deals = []
    for dispensary in Dispensary.objects.raw("SELECT id, ( 3959 * acos( cos( radians({}) ) * cos( radians( lat ) ) * cos( radians( lng ) - radians({}) ) + sin( radians({}) ) * sin( radians( lat ) ) ) ) "
                                             "AS distance FROM main_app_dispensary GROUP BY id HAVING distance < 25 ORDER BY distance LIMIT 0 , 20;".format(g.lat, g.lng, g.lat)):
        for deal in dispensary.deals.all():
            deals.append({'title': deal.title, 'description': deal.description, 'price': deal.price,
                          'expires': deal.date_expires, 'lat': deal.dispensary.lat, 'lng': deal.dispensary.lng})

    return JsonResponse({'deals': deals})


def map_view(request):
    location = request.POST['location']

    center = geocoder.google(location)
    #if center is None:
    #    center = geocoder.google('Hollywood')

    form = SearchForm()

    context = dict()
    context['location'] = location
    context['center'] = center
    context['form'] = form

    return render(request, 'main_app/map_view.html', context)


def deal(request, pk):
    _deal = get_object_or_404(Deal, pk=pk)

    review_form = ReviewForm()

    context = dict()
    context['deal'] = _deal
    context['review_form'] = review_form

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

