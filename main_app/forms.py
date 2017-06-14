from django import forms


class SearchForm(forms.Form):
    location = forms.CharField(max_length=55)