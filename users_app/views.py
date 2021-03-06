# views.py
import django
from .forms import *
from django.contrib.auth.decorators import login_required
from django.contrib.auth import logout
from django.views.decorators.csrf import csrf_protect
from django.views.decorators.csrf import csrf_exempt
from django.shortcuts import render_to_response, render
from django.http import HttpResponseRedirect, JsonResponse
from django.template import RequestContext
from main_app.models import Dispensary, Location, Coupon, Deal, Charge
from main_app.forms import SearchForm, CreateDealForm
from users_app.models import Profile
from main_app.views import get_deals_around
from main_app.decorators import is_dispensary
from collections import defaultdict
from time import strptime


def register(request):
    search_form = SearchForm()
    if request.method == 'POST':
        form = RegistrationForm(request.POST)
        if form.is_valid():
            user = User.objects.create_user(
                username=form.cleaned_data['first_name'],
                password=form.cleaned_data['password1'],
                email=form.cleaned_data['email'],
                first_name=form.cleaned_data['first_name'],
                last_name=form.cleaned_data['last_name']
            )
            user.profile.user_type = 0
            user.save()
            return HttpResponseRedirect('/register/success/')
    else:
        form = RegistrationForm()
    variables = {
        'form': form,
        'search_form': search_form
    }

    return render(request, 'registration/signup.html', variables)


def register_success(request):
    return render_to_response(
        'registration/success.html',
    )


def register_dispensary(request):
    search_form = SearchForm()
    if request.method == 'POST':
        form = DispensaryRegistrationForm(request.POST)
        if form.is_valid():
            user = User.objects.create_user(
                username=form.cleaned_data['first_name'] + ' ' + form.cleaned_data['last_name'],
                password=form.cleaned_data['password1'],
                email=form.cleaned_data['business_email'],
                first_name=form.cleaned_data['first_name'],
                last_name=form.cleaned_data['last_name']
            )
            user.profile.user_type = 1
            user.profile.phone_number = form.cleaned_data['business_phone']
            user.save()
            location = Location(city=form.cleaned_data['city'], state=form.cleaned_data['state'], street_address=form.cleaned_data['street_address'])
            location.save()
            #print(form.cleaned_data['working_from'])
            working_from = strptime(form.cleaned_data['working_from'], "%H:%M")
            working_to = strptime(form.cleaned_data['working_to'], "%H:%M")
            #print(working_from)
            dispensary = Dispensary(location=location, name=form.cleaned_data['dispensary_name'], description='blabla', website=form.cleaned_data['website'],
                                    working_from=form.cleaned_data['working_from'], working_to=form.cleaned_data['working_to'])
            dispensary.save()
            user.profile.dispensary = dispensary
            user.save()
            user.profile.save()
            #print(user.profile.dispensary.description)
            return HttpResponseRedirect('/register/success/')
        else:
            #print('shit')
            pass
    else:
        form = DispensaryRegistrationForm()

    variables = {
        'form': form,
        'search_form': search_form
    }

    return render(request, 'users_app/signup-dispensary.html', variables)


def logout_page(request):
    logout(request)
    return HttpResponseRedirect('/')


@login_required
def home(request):
    return render_to_response(
        'home.html',
        {'user': request.user}
    )


def profile(request):
    charge = Charge.objects.first()

    deal_form = CreateDealForm()
    form = SearchForm()
    user = request.user
    data = dict()
    #print(user.profile.dispensary)

    if user.profile.user_type == Profile.PATIENT or user.profile.user_type is None:

        #groups = defaultdict(int)
        #for coupon in user.coupons.all():
        #    groups[coupon.deal.dispensary] += 1 * coupon.deal.dispensary.points

        points = []

        for dispensary_patient_points in user.dispensaries_points.all():
            pair = {'dispensary': dispensary_patient_points.dispensary, 'points': dispensary_patient_points.total_points}
            points.append(pair)

        data = {'user': user, 'form': form, 'points': points}
        return render(request, 'users_app/profile.html', data)
    else:

        data = {'user': user, 'form': form, 'deal_form': deal_form, 'featured_cost': charge.featured_cost}

        dispensary = user.profile.dispensary
        deals = dispensary.deals.all()

        # Charging for featured deals
        for deal in deals:
            if deal.type == deal.FEATURED and deal.status == deal.ACTIVE:
                delta = django.utils.timezone.now().date() - deal.date_featured_charge
                dispensary.profile.balance -= delta.days * charge.featured_cost
                dispensary.profile.save()
                deal.date_featured_charge = django.utils.timezone.now().date()
                deal.save()

        # Checking if there're waiting for featured deals and if there's a slot available
        waiting_deal = None

        for deal in deals:
            if deal.type == deal.WAITING and deal.status == deal.ACTIVE:
                waiting_deal = deal

        if waiting_deal is not None:
            count = 0
            location_string = "{} {} {}".format(dispensary.location.street_address, dispensary.location.city, dispensary.location.state)
            deals_around = get_deals_around(location_string)
            for _deal in deals_around:
                if _deal['type'] == Deal.FEATURED:
                    count += 1

            if count < 6:
                waiting_deal.type = Deal.FEATURED
                waiting_deal.date_featured_charge = django.utils.timezone.now().date()
                waiting_deal.save()
                data['new_featured_deal'] = waiting_deal

        return render(request, 'users_app/profile-dispensary.html', data)


def change_email(request):
    data = {'value': request.POST["value"]}

    user = request.user
    email = request.POST["value"]
    if User.objects.filter(email=email).first() is None:
        user.email = email
    user.save()
    #print("GOGOGOOGOGOG" + data['value'])
    return JsonResponse(data)


def change_first_name(request):

    data = {'value': request.POST["value"]}

    user = request.user
    user.first_name = request.POST["value"]
    user.save()
    #print("GOGOGOOGOGOG" + data['value'])

    return JsonResponse(data)


def change_last_name(request):
    data ={'value': request.POST["value"] }

    user = request.user
    user.last_name = request.POST["value"]
    user.save()

    return JsonResponse(data)


@is_dispensary
def change_street_address(request):
    user = request.user
    user.profile.dispensary.location.street_address = request.POST["value"]
    user.profile.dispensary.location.save()
    user.save()

    return JsonResponse({'value':'OK'})


@is_dispensary
def change_city(request):
    user = request.user
    user.profile.dispensary.location.city = request.POST["value"]
    user.profile.dispensary.location.save()
    user.save()

    return JsonResponse({'value':'OK'})


@is_dispensary
def change_state(request):
    user = request.user
    user.profile.dispensary.location.state = request.POST["value"]
    user.profile.dispensary.location.save()
    user.save()

    return JsonResponse({'value':'OK'})


@is_dispensary
def change_website(request):
    user = request.user
    user.profile.dispensary.website = request.POST["value"]
    user.profile.dispensary.save()

    return JsonResponse({'value': 'OK'})


@is_dispensary
def change_dispensary_name(request):
    user = request.user
    user.profile.dispensary.name = request.POST["value"]
    user.profile.dispensary.save()

    return JsonResponse({'value': 'OK'})


def change_phone_number(request):
    user = request.user
    user.profile.phone_number = request.POST["value"]
    user.save()

    return JsonResponse({'value': 'OK'})


@csrf_exempt
def upload_image(request):
    user = request.user
    user.profile.avatar = request.FILES['file']
    user.save()

    return JsonResponse({'value': 'OK'})


def change_about(request):
    user = request.user
    user.profile.about = request.POST["value"]
    user.profile.save()

    return JsonResponse({'value': 'OK'})


def change_reward_points(request):
    user = request.user
    user.profile.dispensary.points = request.POST['value']
    user.profile.dispensary.save()

    return JsonResponse({'value': 'OK'})