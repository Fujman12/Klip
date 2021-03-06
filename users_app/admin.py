from django.contrib import admin
from .models import Profile
from django.contrib.auth.models import User
from django.contrib.auth.admin import UserAdmin


class UserProfileInline(admin.StackedInline):
    model = Profile


class UserAdmin(UserAdmin):
    inlines = [UserProfileInline]


#admin.site.unregister(User)
admin.site.register(Profile)
