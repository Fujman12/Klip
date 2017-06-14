# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2017-06-13 18:32
from __future__ import unicode_literals

import datetime
from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Deal',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=150)),
                ('description', models.TextField()),
                ('price', models.DecimalField(decimal_places=2, max_digits=10)),
                ('likes', models.IntegerField(default=0)),
                ('dislikes', models.IntegerField(default=0)),
                ('date_created', models.DateTimeField(auto_now_add=True)),
                ('date_starts', models.DateField(default=django.utils.timezone.now)),
                ('date_expires', models.DateField(default=datetime.datetime(2017, 7, 13, 18, 32, 10, 879582))),
            ],
        ),
        migrations.CreateModel(
            name='Dispensary',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50)),
                ('city', models.CharField(max_length=30)),
                ('state', models.CharField(max_length=30)),
                ('description', models.TextField()),
                ('lat', models.FloatField()),
                ('lng', models.FloatField()),
            ],
        ),
        migrations.AddField(
            model_name='deal',
            name='dispensary',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='deals', to='main_app.Dispensary'),
        ),
    ]
