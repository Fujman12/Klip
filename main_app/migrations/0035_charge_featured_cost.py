# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2017-09-11 14:04
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('main_app', '0034_remove_charge_featured_cost'),
    ]

    operations = [
        migrations.AddField(
            model_name='charge',
            name='featured_cost',
            field=models.DecimalField(decimal_places=2, default=1.0, max_digits=10),
        ),
    ]