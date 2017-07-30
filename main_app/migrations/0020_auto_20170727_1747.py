# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2017-07-27 17:47
from __future__ import unicode_literals

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('main_app', '0019_auto_20170727_1745'),
    ]

    operations = [
        migrations.AlterField(
            model_name='deal',
            name='date_expires',
            field=models.DateField(default=datetime.datetime(2017, 8, 26, 17, 47, 13, 433171)),
        ),
        migrations.AlterField(
            model_name='deal',
            name='status',
            field=models.CharField(choices=[('1', 'Active'), ('2', 'Pending'), ('0', 'Inactive')], default='2', max_length=1),
        ),
    ]
