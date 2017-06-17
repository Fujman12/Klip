from django import forms
from .models import Review

class SearchForm(forms.Form):
    location = forms.CharField(max_length=55)


class ReviewForm(forms.ModelForm):

    text = forms.CharField(widget=forms.Textarea, required=True)

    class Meta:
        model = Review
        fields = ['text',]

