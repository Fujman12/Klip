# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2017-09-11 13:50
from __future__ import unicode_literals

from django.db import migrations, models
import main_app.models


class Migration(migrations.Migration):

    dependencies = [
        ('main_app', '0032_auto_20170909_1503'),
    ]

    operations = [
        migrations.AddField(
            model_name='charge',
            name='featured_cost',
            field=models.DecimalField(decimal_places=2, default=1.0, max_digits=10),
        ),
        migrations.AddField(
            model_name='deal',
            name='date_featured_charge',
            field=models.DateField(null=True),
        ),
        migrations.AlterField(
            model_name='deal',
            name='date_expires',
            field=models.DateField(default=main_app.models.plus_30_days_date),
        ),
        migrations.AlterField(
            model_name='deal',
            name='type',
            field=models.CharField(choices=[('0', 'Regular'), ('1', 'Featured'), ('2', 'Waiting')], default='0', max_length=1),
        ),
    ]
