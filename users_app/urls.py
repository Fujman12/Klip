from django.conf.urls import include, url
from users_app import views

app_name = 'users_app'

urlpatterns = [

    url(r'^$', views.profile, name='profile'),
    url(r'^change_email', views.change_email, name = 'change_email'),
    url(r'^change_first_name', views.change_first_name, name = 'change_first_name'),
    url(r'^change_last_name', views.change_last_name, name = 'change_last_name'),

    #changes user.profile
    url(r'^change_street_address', views.change_street_address, name = 'change_street_address'),
    url(r'^change_state', views.change_state, name = 'change_state'),
    url(r'^change_city', views.change_city, name='change_city'),
    url(r'^change_apt_unit', views.change_apt_unit, name='change_apt_unit'),
    url(r'^change_zipcode', views.change_zipcode, name='change_zipcode'),
    url(r'^change_phone_number', views.change_phone_number, name='change_phone_number'),
    url(r'^upload_image', views.upload_image, name='upload_image'),

]