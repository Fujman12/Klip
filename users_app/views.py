# views.py
from .forms import *
from django.contrib.auth.decorators import login_required
from django.contrib.auth import logout
from django.views.decorators.csrf import csrf_protect
from django.views.decorators.csrf import csrf_exempt
from django.shortcuts import render_to_response, render
from django.http import HttpResponseRedirect, JsonResponse
from django.template import RequestContext
from main_app.models import Dispensary, Location
from main_app.forms import SearchForm
from users_app.models import Profile


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
                username=form.cleaned_data['first_name'],
                password=form.cleaned_data['password1'],
                email=form.cleaned_data['business_email'],
                first_name=form.cleaned_data['first_name'],
                last_name=form.cleaned_data['last_name']
            )
            user.profile.user_type = 1

            user.save()
            location = Location(city=form.cleaned_data['city'], state=form.cleaned_data['state'], street_address=form.cleaned_data['street_address'])
            location.save()
            dispensary = Dispensary(location=location, name=form.cleaned_data['dispensary_name'], description='blabla')
            dispensary.save()
            user.profile.dispensary = dispensary
            user.save()
            return HttpResponseRedirect('/register/success/')
        else:
            print('shit')
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

    form = SearchForm()
    user = request.user

    data = {'user': user, 'form': form}
    if user.profile.user_type == Profile.PATIENT or user.profile.user_type is None:
        return render(request, 'users_app/profile.html', data)
    else:
        return JsonResponse({'status': 'not yet'})


def change_email(request):
    data = {'value': request.POST["value"]}

    user = request.user
    user.email = request.POST["value"]
    user.save()
    print("GOGOGOOGOGOG" + data['value'])
    return JsonResponse(data)


def change_first_name(request):

    data = {'value': request.POST["value"]}

    user = request.user
    user.first_name = request.POST["value"]
    user.save()
    print("GOGOGOOGOGOG" + data['value'])

    return JsonResponse(data)


def change_last_name(request):
    data ={ 'value' :request.POST["value"] }

    user = request.user
    user.last_name = request.POST["value"]
    user.save()

    return JsonResponse(data)


def change_street_address(request):
    user = request.user
    user.profile.street_address = request.POST["value"]
    user.save()

    return JsonResponse({'value':'OK'})


def change_city(request):
    user = request.user
    user.profile.city = request.POST["value"]
    user.save()

    return JsonResponse({'value':'OK'})


def change_state(request):
    user = request.user
    user.profile.state = request.POST["value"]
    user.save()

    return JsonResponse({'value':'OK'})


def change_apt_unit(request):
    user = request.user
    user.profile.apt_unit = request.POST["value"]
    user.save()

    return JsonResponse({'value': 'OK'})


def change_zipcode(request):
    user = request.user
    user.profile.zipcode = request.POST["value"]
    user.save()

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
