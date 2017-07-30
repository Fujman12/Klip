from django.conf.urls import include, url
from . import views

urlpatterns = [

    url(r'^$',views.index, name='index'),
    url(r'deals_around', views.deals_around, name='deals_around'),
    url(r'map_view', views.map_view, name='map_view'),

    url(r'deal/(?P<pk>[0-9]+)', views.deal, name='deal'),
    url(r'update_likes/(?P<pk>[0-9]+)', views.update_likes, name='update_likes'),
    url(r'post_review/(?P<pk>[0-9]+)', views.post_review, name='post_review'),
    url(r'create_deal', views.create_deal, name='create_deal'),
    url(r'upload_deal_image/(?P<pk>[0-9]+)', views.upload_deal_image, name='upload_deal_image'),
    url(r'deal_image_remove', views.deal_image_remove, name='deal_image_remove'),
    url(r'create_coupon/(?P<pk>[0-9]+)', views.create_coupon, name='create_coupon'),
    url(r'coupon_details/(?P<pk>[0-9]+)', views.coupon_details, name='coupon_details'),
    url(r'change_deal_status/(?P<pk>[0-9]+)', views.change_deal_status, name='change_deal_status'),
    url(r'deal_remove/(?P<pk>[0-9]+)', views.remove_deal, name='remove_deal'),
    url(r'activation_attempt/(?P<pk>[0-9]+)', views.activation_attempt, name="activation_attempt"),
    url(r'patient_view/(?P<pk>[0-9]+)', views.patient_view, name="patient_view"),
    url(r'coupon_details/(?P<pk>[0-9]+)', views.coupon_details, name="coupon_details"),
]