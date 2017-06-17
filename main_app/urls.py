from django.conf.urls import include, url
from . import views

urlpatterns = [

    url(r'^$',views.index, name='index'),
    url(r'deals_around', views.deals_around, name='deals_around'),
    url(r'map_view', views.map_view, name='map_view'),

    url(r'deal/(?P<pk>[0-9]+)', views.deal, name='deal'),
    url(r'update_likes/(?P<pk>[0-9]+)', views.update_likes, name='update_likes'),
    url(r'post_review/(?P<pk>[0-9]+)', views.post_review, name='post_review'),

]