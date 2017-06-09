from django.db import models
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.dispatch import receiver


class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    street_address = models.CharField(max_length=90, blank=False, null=True)
    apt_unit = models.CharField(max_length=10, blank=False, null=True)
    birth_date = models.DateField(null=True, blank=False)
    city = models.CharField(max_length=100, blank=False, null=True)
    state = models.CharField(max_length=100, blank=True, null=True)
    zipcode = models.CharField('ZIP code', max_length=5, blank=True, null=True)
    phone_number = models.CharField('Phone number', max_length=35, blank=True, null=True)


@receiver(post_save, sender=User)
def create_user_profile(sender, instance, created, **kwargs):
    if created:
        Profile.objects.create(user=instance)


@receiver(post_save, sender=User)
def save_user_profile(sender, instance, **kwargs):
    instance.profile.save()
