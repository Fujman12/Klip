"""klip URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url, include
from django.conf.urls.static import static
from django.contrib import admin

from main_app.views import e_handler404, e_handler500, index, contact_us, about_us
from users_app.views import register, register_success
from django.contrib.auth import views as auth_views
from django.conf import settings
from django.views.static import serve

urlpatterns = [
    url(r'^admin/', admin.site.urls),

    url('^$', index, name = 'index'),
    url(r'^login/$', auth_views.login, name='login'),
    url(r'^logout/$', auth_views.logout, name='logout'),
    url(r'^oauth/', include('social_django.urls', namespace='social')),  # <--

    url(r'^register/$', register, name = 'register'),
    url(r'^register/success/$', register_success, name = 'register_success'),

    url(r'^profile/', include('users_app.urls')),
    url(r'^site/',include('main_app.urls')),

    url(r'^contact_us/', contact_us, name='contact_us'),
    url(r'^about_us/', about_us, name='about_us'),
]

handler404 = e_handler404
handler500 = e_handler500

#if settings.DEBUG:
urlpatterns += [
    url(r'^media/(?P<path>.*)$', serve, {
        'document_root': settings.MEDIA_ROOT,
    }),
]