# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2017-07-07 08:23
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users_app', '0008_auto_20170706_2054'),
    ]

    operations = [
        migrations.AlterField(
            model_name='profile',
            name='user_type',
            field=models.IntegerField(choices=[(0, 'Patient'), (1, 'Dispensary')], null=True),
        ),
    ]