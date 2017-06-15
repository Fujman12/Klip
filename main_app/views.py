from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from django.http import JsonResponse, HttpResponse
from django.views.decorators.csrf import csrf_exempt
from .models import Deal, Dispensary
from .forms import SearchForm
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



