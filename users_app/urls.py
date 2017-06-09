from django.conf.urls import include, url
from users_app import views

app_name = 'users_app'

urlpatterns = [

    url(r'^$', views.profile, name='profile'),
    url(r'^change_email', views.change_email, name = 'change_email'),
    url(r'^change_first_name', views.change_first_name, name = 'change_first_name'),
    url(r'^change_last_name', views.change_last_name, name = 'change_last_name')

]