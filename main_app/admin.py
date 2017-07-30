from django.contrib import admin
from .models import Dispensary, Deal, Review, Location, DealImage, Coupon
#from main_app.admin import DispensaryAdmin
# Register your models here.
admin.site.register(Dispensary)
admin.site.register(Deal)
admin.site.register(Review)
admin.site.register(Location)
admin.site.register(DealImage)
admin.site.register(Coupon)

#class LocationInline(admin.StackedInline):
#    model = Location


#class ExtendedDispensaryAdmin(admin.ModelAdmin):
#    inlines = (LocationInline,)


#admin.site.register(Dispensary, ExtendedDispensaryAdmin)