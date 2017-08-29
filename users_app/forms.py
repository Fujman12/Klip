# files.py
import re
from django import forms
from django.contrib.auth.models import User
from django.utils.translation import ugettext_lazy as _


class RegistrationForm(forms.Form):
    first_name = forms.CharField(required=True, max_length=30, label=_("First name"))
    last_name = forms.CharField(required=True, max_length=30,label=_("Last name"))
    email = forms.EmailField(widget=forms.TextInput(attrs=dict(required=True, max_length=30)), label=_("Email address"))
    password1 = forms.CharField(
        widget=forms.PasswordInput(attrs=dict(required=True, max_length=30, render_value=False)), label=_("Password"))
    password2 = forms.CharField(
        widget=forms.PasswordInput(attrs=dict(required=True, max_length=30, render_value=False)), label=_("Password (again)"))

    def clean_email(self):
        try:
            user = User.objects.get(email__iexact=self.cleaned_data['email'])
        except User.DoesNotExist:
            return self.cleaned_data['email']
        raise forms.ValidationError(_("The email already exists. Please try another one."))

    def clean(self):
        if 'password1' in self.cleaned_data and 'password2' in self.cleaned_data:
            if self.cleaned_data['password1'] != self.cleaned_data['password2']:
                raise forms.ValidationError(_("The two password fields did not match."))
        return self.cleaned_data


TIME_CHOICES = (
    ('07:00', '07:00'),
    ('08:00', '08:00'),
    ('09:00', '09:00'),
    ('10:00', '10:00'),
    ('11:00', '11:00'),
    ('12:00', '12:00'),
    ('13:00', '13:00'),
    ('14:00', '14:00'),
    ('15:00', '15:00'),
    ('16:00', '16:00'),
    ('17:00', '17:00'),
    ('18:00', '18:00'),
    ('19:00', '19:00'),
    ('20:00', '20:00'),
    ('21:00', '21:00'),
    ('22:00', '22:00'),
    ('23:00', '23:00'),
    ('00:00', '00:00'),
    ('01:00', '01:00'),
    ('02:00', '02:00'),
    ('03:00', '03:00'),
    ('04:00', '04:00'),
    ('05:00', '05:00'),
    ('06:00', '06:00'),
)


class DispensaryRegistrationForm(forms.Form):
    first_name = forms.CharField(required=True, max_length=30, label=_("First name"))
    last_name = forms.CharField(required=True, max_length=30,label=_("Last name"))
    dispensary_name = forms.CharField(required=True, max_length=50, label=_("Dispensary name"))
    business_phone = forms.CharField(required=False, max_length=30, label=_("Business phone"))
    street_address = forms.CharField(required=True, max_length=50, label=_("Street address"))
    city = forms.CharField(required=True, max_length=30, label=_("City"))
    state = forms.CharField(required=True, max_length=30, label=_("State"))
    website = forms.CharField(required=True, max_length=100, label=_("Website"))
    business_email = forms.EmailField(widget=forms.TextInput(attrs=dict(required=True, max_length=30)), label=_("Email address"))
    working_from = forms.ChoiceField(choices=TIME_CHOICES, label="", initial='', widget=forms.Select(), required=True)
    working_to = forms.ChoiceField(choices=TIME_CHOICES, label="", initial='', widget=forms.Select(), required=True)
    password1 = forms.CharField(
        widget=forms.PasswordInput(attrs=dict(required=True, max_length=30, render_value=False)), label=_("Password"))
    password2 = forms.CharField(
        widget=forms.PasswordInput(attrs=dict(required=True, max_length=30, render_value=False)), label=_("Password (again)"))

    def clean_email(self):
        try:
            user = User.objects.get(email__iexact=self.cleaned_data['email'])
        except User.DoesNotExist:
            return self.cleaned_data['email']
        raise forms.ValidationError(_("The email already exists. Please try another one."))

    def clean(self):
        if 'password1' in self.cleaned_data and 'password2' in self.cleaned_data:
            if self.cleaned_data['password1'] != self.cleaned_data['password2']:
                raise forms.ValidationError(_("The two password fields did not match."))
        return self.cleaned_data