# -*- coding: utf-8 -*-
# Generated by Django 1.9 on 2016-09-16 00:32
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('fgs_blog', '0002_articles_header'),
    ]

    operations = [
        migrations.AddField(
            model_name='articles',
            name='is_delete',
            field=models.BooleanField(default=False),
        ),
    ]
