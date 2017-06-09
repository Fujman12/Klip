# views.py
from .forms import *
from django.contrib.auth.decorators import login_required
from django.contrib.auth import logout
from django.views.decorators.csrf import csrf_protect
from django.shortcuts import render_to_response, render
from django.http import HttpResponseRedirect, JsonResponse
from django.template import RequestContext


def register(request):
    if request.method == 'POST':
        form = RegistrationForm(request.POST)
        if form.is_valid():
            user = User.objects.create_user(
                username=form.cleaned_data['email'],
                password=form.cleaned_data['password1'],
                email=form.cleaned_data['email'],
                first_name=form.cleaned_data['first_name'],
                last_name=form.cleaned_data['last_name']
            )
            return HttpResponseRedirect('/register/success/')
    else:
        form = RegistrationForm()
    variables = {
        'form': form
    }

    return render(request, 'registration/signup.html', variables)


def register_success(request):
    return render_to_response(
        'registration/success.html',
    )


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
    user = request.user

    data = {'user': user}
    return render(request, 'users_app/profile.html', data)


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
