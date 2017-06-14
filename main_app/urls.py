from django.conf.urls import include, url
from . import views

urlpatterns = [

    url(r'^$',views.index, name='index'),
    url(r'deals_around', views.deals_around, name='deals_around'),
    url(r'map_view', views.map_view, name='map_view')
]