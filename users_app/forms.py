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