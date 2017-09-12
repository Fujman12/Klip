from django.db import models
from datetime import timedelta, datetime
from django.contrib.auth.models import User
import django
import geocoder
import qrcode
import random
import string
# Create your models here.


def plus_30_days_date():
    return django.utils.timezone.now() + timedelta(days=30)


class Deal(models.Model):
    CATEGORY_CHOICES = (
        ('in', 'Indica'),
        ('sa', 'Sativa'),
        ('hy', 'Hybrid'),
        ('cbd', 'CBD'),
        ('co', 'Concentrates'),
        ('ed', 'Edibles')
    )
    INACTIVE = '0'
    ACTIVE = '1'
    PENDING = '2'

    STATUS_CHOICES = (
        (ACTIVE, 'Active'),
        (PENDING, 'Pending'),
        (INACTIVE, 'Inactive')
    )

    REGULAR = '0'
    FEATURED = '1'
    WAITING = '2'

    TYPE_CHOICES = (
        (REGULAR, 'Regular'),
        (FEATURED, 'Featured'),
        (WAITING, 'Waiting')
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
    date_expires = models.DateField(default=plus_30_days_date)
    date_featured_charge = models.DateField(null=True, blank=True)

    dispensary = models.ForeignKey('Dispensary', on_delete=models.CASCADE, related_name='deals')

    status = models.CharField(max_length=1, null=False, default=PENDING, choices=STATUS_CHOICES)
    type = models.CharField(max_length=1, null=False, default=REGULAR, choices=TYPE_CHOICES)

    def __str__(self):
        return "{} - by {}".format(self.title, self.dispensary.name)


def get_deal_upload_path(instance, filename):

    return 'deal_{0}/{1}'.format(instance.deal.id, filename)


class DealImage(models.Model):
    image = models.ImageField(upload_to=get_deal_upload_path, null=True)
    deal = models.ForeignKey('Deal', on_delete=models.CASCADE, related_name='images')

    def __str__(self):
        return "Image for '{}' ".format(self.deal.title)


class Dispensary(models.Model):
    name = models.CharField(max_length=50, blank=False, null=False)
    description = models.TextField(blank=False, null=False)
    website = models.CharField(max_length=100, null=True)
    location = models.OneToOneField('Location', null=True)
    secret = models.CharField(max_length=10, null=True)
    points = models.IntegerField(blank=False, null=False, default=1)

    working_from = models.TimeField(null=True)
    working_to = models.TimeField(null=True)

    class Meta:
        verbose_name_plural = "dispensaries"

    def __str__(self):
        return "{} - {}, {}".format(self.name, self.location.city, self.location.state)

    def save(self, *args, **kwargs):
        if self.pk is None:
            self.secret = ''.join(random.choice(string.ascii_lowercase) for i in range(10))

        super(Dispensary, self).save(*args, **kwargs)


class DispensaryPatientPoints(models.Model):
    user = models.ForeignKey(User, related_name='dispensaries_points')
    dispensary = models.ForeignKey(Dispensary, related_name='users_points')
    total_points = models.IntegerField(blank=False, null=False, default=0)


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

        location_string = "{} {} {}".format(self.city, self.state, self.street_address)
        g = geocoder.google(location_string)

        self.lat = g.lat
        self.lng = g.lng

        super(Location, self).save(*args, **kwargs)

    def __str__(self):
        location_string = "{}, {}, {}".format(self.street_address, self.city, self.state, )
        return location_string


def get_coupon_upload_path(instance, filename):
    return 'coupon_{0}/{1}'.format(instance.id, filename)


class Coupon(models.Model):
    USED = '0'
    ACTIVE = '1'

    STATUS_CHOICES = (
        (ACTIVE, 'Active'),
        (USED, 'Used'),
    )

    deal = models.ForeignKey(Deal, related_name='coupons')
    user = models.ForeignKey(User, related_name='coupons')
    date_created = models.DateTimeField(auto_now_add=True)
    qr_image = models.ImageField(null=True, upload_to=get_coupon_upload_path)
    status = models.CharField(choices=STATUS_CHOICES, max_length=3, default=ACTIVE)

    def activation_auth(self, secret):
        if secret == self.deal.dispensary.secret:
            return True
        else:
            return False

    def __str__(self):
        string = "{}, {} - {}; {}".format(self.user.first_name, self.user.last_name, self.deal.title, self.date_created)
        return string


class Order(models.Model):
    NEW = '0'
    PAID = '1'

    STATUS_CHOICES = (
        (NEW, 'New'),
        (PAID, 'Paid'),
    )

    dispensary = models.ForeignKey(Dispensary, related_name='orders', null=True)
    amount = models.DecimalField(blank=False, null=False, max_digits=10, decimal_places=2)
    status = models.CharField(choices=STATUS_CHOICES, max_length=3, default=NEW)

    def __str__(self):
        string = "{} USD - {}".format(self.amount, self.dispensary.name)
        return string


#def save(self, *args, **kwargs):
#    if self.pk is None:
#        from django.urls import reverse
#        url = reverse('coupon_details', args=[str(1)])
#
#        img = qrcode.make(url)
#        self.qr_image = img

#    super(Coupon, self).save(*args, **kwargs)

class Charge(models.Model):
    cost_per_click = models.DecimalField(null=False, blank=False, max_digits=10, decimal_places=2, default=0.05)
    featured_cost = models.DecimalField(null=False, blank=False, max_digits=10, decimal_places=2, default=1.00)

    def __str__(self):
        _string = "Current cost per click = {} USD".format(self.cost_per_click)
        return _string
