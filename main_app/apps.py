from django.apps import AppConfig
from .models import Charge


class MainAppConfig(AppConfig):
    name = 'main_app'

    def ready(self):
        charge = Charge()
