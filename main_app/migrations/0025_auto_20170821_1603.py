# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2017-08-21 16:03
from __future__ import unicode_literals

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('main_app', '0024_auto_20170729_2308'),
    ]

    operations = [
        migrations.AlterField(
            model_name='deal',
            name='date_expires',
            field=models.DateField(default=datetime.datetime(2017, 9, 20, 16, 3, 24, 655877)),
        ),
    ]