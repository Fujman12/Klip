# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2017-09-11 13:52
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('main_app', '0033_auto_20170911_1350'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='charge',
            name='featured_cost',
        ),
    ]