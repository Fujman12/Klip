from django import forms
from .models import Review, DealImage
from datetime import datetime

class SearchForm(forms.Form):
    location = forms.CharField(max_length=55)


class ReviewForm(forms.ModelForm):

    text = forms.CharField(widget=forms.Textarea, required=True)

    class Meta:
        model = Review
        fields = ['text',]


CATEGORY_CHOICES = (
    ('in', 'Indica'),
    ('sa', 'Sativa'),
    ('hy', 'Hybrid'),
    ('cbd', 'CBD'),
    ('co', 'Concentrates'),
    ('ed', 'Edibles')
)


class CreateDealForm(forms.Form):
    title = forms.CharField(max_length=55, required=True)
    description = forms.CharField(widget=forms.Textarea, required=True)
    status = forms.ChoiceField(choices=CATEGORY_CHOICES, label="", initial='', widget=forms.Select(), required=True)
    price = forms.DecimalField(max_digits=10, decimal_places=2)
    old_price = forms.DecimalField(max_digits=10, decimal_places=2)
    date_start = forms.DateField()
    date_end = forms.DateField()


class ImageUploadForm(forms.ModelForm):

    class Meta:
        model = DealImage
        fields = ['image']


class SelectAmountForm(forms.Form):
    AMOUNT_CHOICES = (
        ('50', '50 USD'),
        ('100', '100 USD'),
        ('200', '200 USD'),
        ('500', '500 USD'),
        ('1000', '1000 USD'),
    )

    amount = forms.ChoiceField(choices=AMOUNT_CHOICES, label="", initial='', widget=forms.Select(), required=True)

