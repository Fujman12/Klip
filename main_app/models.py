from django.db import models
from datetime import timedelta, datetime
import django
# Create your models here.


class Deal(models.Model):
    title = models.CharField(max_length=150, blank=False, null=False)
    description = models.TextField(blank=False, null=False)
    price = models.DecimalField(blank=False, null=False, max_digits=10, decimal_places=2)
    likes = models.IntegerField(blank=False, null=False, default=0)
    dislikes = models.IntegerField(blank=False, null=False, default=0)

    date_created = models.DateTimeField(auto_now_add=True)
    date_starts = models.DateField(default=django.utils.timezone.now)
    date_expires = models.DateField(default=datetime.now() + timedelta(days=30))

    dispensary = models.ForeignKey('Dispensary', on_delete=models.CASCADE, related_name='deals')

    def __str__(self):
        return "{} - {} provided by {}".format(self.title, self.description, self.dispensary.name)


class Dispensary(models.Model):
    name = models.CharField(max_length=50, blank=False, null=False)
    city = models.CharField(max_length=30, blank=False, null=False)
    state = models.CharField(max_length=30, blank=False, null=False)
    description = models.TextField(blank=False, null=False)
    lat = models.FloatField()
    lng = models.FloatField()

    class Meta:
        verbose_name_plural = "dispensaries"

    def __str__(self):
        return "{} - {}".format(self.name, self.description)



