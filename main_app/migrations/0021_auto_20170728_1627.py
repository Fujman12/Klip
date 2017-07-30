# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2017-07-28 16:27
from __future__ import unicode_literals

import datetime
from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion
import main_app.models


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('main_app', '0020_auto_20170727_1747'),
    ]

    operations = [
        migrations.CreateModel(
            name='Coupon',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date_created', models.DateTimeField(auto_now_add=True)),
                ('qr_image', models.ImageField(upload_to=main_app.models.get_coupon_upload_path)),
            ],
        ),
        migrations.AlterField(
            model_name='deal',
            name='date_expires',
            field=models.DateField(default=datetime.datetime(2017, 8, 27, 16, 27, 29, 91204)),
        ),
        migrations.AddField(
            model_name='coupon',
            name='deal',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='coupons', to='main_app.Deal'),
        ),
        migrations.AddField(
            model_name='coupon',
            name='user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='coupons', to=settings.AUTH_USER_MODEL),
        ),
    ]
