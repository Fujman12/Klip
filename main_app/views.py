from django.shortcuts import render
from django.http import JsonResponse
# Create your views here.
def index(request):
    data=dict()
    data['sdf'] = 'sdf'
    return render(request, 'main_app/index.html')