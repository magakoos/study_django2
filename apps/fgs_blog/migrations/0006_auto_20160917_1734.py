# -*- coding: utf-8 -*-
# Generated by Django 1.9 on 2016-09-17 17:34
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('fgs_blog', '0005_auto_20160917_0931'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='tag',
            name='articles',
        ),
        migrations.AddField(
            model_name='article',
            name='tags',
            field=models.ManyToManyField(to='fgs_blog.Tag'),
        ),
        migrations.AlterField(
            model_name='article',
            name='body',
            field=models.CharField(max_length=8192, verbose_name='\u0422\u0435\u043a\u0441\u0442'),
        ),
        migrations.AlterField(
            model_name='article',
            name='change_date',
            field=models.DateTimeField(auto_now=True, verbose_name='\u0414\u0430\u0442\u0430 \u0438\u0437\u043c\u0435\u043d\u0435\u043d\u0438\u044f'),
        ),
        migrations.AlterField(
            model_name='article',
            name='create_date',
            field=models.DateTimeField(auto_now_add=True, verbose_name='\u0414\u0430\u0442\u0430 \u0441\u043e\u0437\u0434\u0430\u043d\u0438\u044f'),
        ),
        migrations.AlterField(
            model_name='article',
            name='header',
            field=models.CharField(max_length=128, verbose_name='\u0417\u0430\u0433\u043e\u043b\u043e\u0432\u043e\u043a'),
        ),
    ]