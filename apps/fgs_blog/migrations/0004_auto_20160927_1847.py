# -*- coding: utf-8 -*-
# Generated by Django 1.9 on 2016-09-27 18:47
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('fgs_blog', '0003_auto_20160927_1647'),
    ]

    operations = [
        migrations.AddField(
            model_name='article',
            name='meta_name_description',
            field=models.CharField(default='', max_length=256, verbose_name="\u0421\u043e\u0434\u0435\u0440\u0436\u0438\u043c\u043e\u0435 meta name='description'"),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='article',
            name='meta_name_keywords',
            field=models.CharField(default='', max_length=256, verbose_name="\u0421\u0449\u0432\u0443\u043a\u0436\u0438\u043c\u043e\u0435 meta name='keywords'"),
            preserve_default=False,
        ),
    ]
