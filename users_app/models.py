from django.db import models
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.dispatch import receiver
from main_app.models import Dispensary


def get_upload_path(instance, filename):

    return 'user_{0}/{1}'.format(instance.user.id, filename)


class BaseProfile(models.Model):
    PATIENT = 0
    DISPENSARY = 1
    USER_TYPES = (
        (PATIENT, 'Patient'),
        (DISPENSARY, 'Dispensary'),
    )
    phone_number = models.CharField('Phone number', max_length=35, blank=True, null=True)
    avatar = models.ImageField(upload_to=get_upload_path, null=True)
    user = models.OneToOneField(User, primary_key=True)
    user_type = models.IntegerField(null=True, choices=USER_TYPES)

    class Meta:
        abstract = True


class PatientProfile(models.Model):
    about = models.TextField(blank=True, null=True)

    class Meta:
        abstract = True


class DispensaryProfile(models.Model):
    balance = models.DecimalField(null=False, max_digits=10, decimal_places=2, default=0)
    dispensary = models.OneToOneField(Dispensary, on_delete=models.CASCADE, null=True)

    class Meta:
        abstract = True


class Profile(BaseProfile, PatientProfile, DispensaryProfile):

    def __str__(self):
        if self.dispensary is not None:
            string = "{} - {}".format(self.user.first_name, self.dispensary.name)
            return string
        else:
            return self.user.first_name

#
#class Profile(models.Model):
#   user = models.OneToOneField(User, on_delete=models.CASCADE)
#    street_address = models.CharField(max_length=90, blank=False, null=True)
#    apt_unit = models.CharField(max_length=10, blank=False, null=True)
#    birth_date = models.DateField(null=True, blank=False)
#    city = models.CharField(max_length=100, blank=False, null=True)
#    state = models.CharField(max_length=100, blank=True, null=True)
#    zipcode = models.CharField('ZIP code', max_length=5, blank=True, null=True)
#    # image
#    avatar = models.ImageField(upload_to=get_upload_path, null=True)


@receiver(post_save, sender=User)
def create_user_profile(sender, instance, created, **kwargs):
    if created:
        Profile.objects.create(user=instance)


@receiver(post_save, sender=User)
def save_user_profile(sender, instance, **kwargs):
    instance.profile.save()
