from django.db import models
from datetime import timedelta, datetime
from django.contrib.auth.models import User
import django
import geocoder
# Create your models here.


class Deal(models.Model):
    CATEGORY_CHOICES = (
        ('in', 'Indica'),
        ('sa', 'Sativa'),
        ('hy', 'Hybrid'),
        ('cbd', 'CBD'),
        ('co', 'Concentrates'),
        ('ed', 'Edibles')
    )
    title = models.CharField(max_length=150, blank=False, null=False)
    description = models.TextField(blank=False, null=False)
    category = models.CharField(max_length=3, choices=CATEGORY_CHOICES, default='in')
    price = models.DecimalField(blank=False, null=False, max_digits=10, decimal_places=2)
    old_price = models.DecimalField(blank=True, null=True, max_digits=10, decimal_places=2)
    likes = models.IntegerField(blank=False, null=False, default=0)
    dislikes = models.IntegerField(blank=False, null=False, default=0)

    date_created = models.DateTimeField(auto_now_add=True)
    date_starts = models.DateField(default=django.utils.timezone.now)
    date_expires = models.DateField(default=datetime.now() + timedelta(days=30))

    dispensary = models.ForeignKey('Dispensary', on_delete=models.CASCADE, related_name='deals')

    def __str__(self):
        return "{} - by {}".format(self.title, self.dispensary.name)


class Dispensary(models.Model):
    name = models.CharField(max_length=50, blank=False, null=False)
    description = models.TextField(blank=False, null=False)
    location = models.OneToOneField('Location', null=True)

    class Meta:
        verbose_name_plural = "dispensaries"

    def __str__(self):
        return "{} - {}, {}".format(self.name, self.location.city, self.location.state)


class Review(models.Model):
    user = models.ForeignKey(User, related_name='reviews')
    text = models.TextField()
    deal = models.ForeignKey('Deal', related_name='reviews')

    date_created = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return "Review for '{}' by {}".format(self.deal.title, self.user.username)


class Location(models.Model):
    city = models.CharField(max_length=30, blank=False, null=False)
    state = models.CharField('State abbreviation', max_length=30, blank=False, null=False)
    street_address = models.CharField(max_length=90, blank=False, null=True)

    lat = models.FloatField()
    lng = models.FloatField()

    def save(self, *args, **kwargs):
        if self.pk is None:
            location_string = "{} {} {}".format(self.city, self.state, self.street_address)
            g = geocoder.google(location_string)

            self.lat = g.lat
            self.lng = g.lng

        super(Location, self).save(*args, **kwargs)

    def __str__(self):
        location_string = "{}, {}, {}".format(self.street_address, self.city, self.state, )
        return location_string

