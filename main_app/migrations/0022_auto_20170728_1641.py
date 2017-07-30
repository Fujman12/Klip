# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2017-07-28 16:41
from __future__ import unicode_literals

import datetime
from django.db import migrations, models
import main_app.models


class Migration(migrations.Migration):

    dependencies = [
        ('main_app', '0021_auto_20170728_1627'),
    ]

    operations = [
        migrations.AlterField(
            model_name='coupon',
            name='qr_image',
            field=models.ImageField(null=True, upload_to=main_app.models.get_coupon_upload_path),
        ),
        migrations.AlterField(
            model_name='deal',
            name='date_expires',
            field=models.DateField(default=datetime.datetime(2017, 8, 27, 16, 41, 10, 86272)),
        ),
    ]
