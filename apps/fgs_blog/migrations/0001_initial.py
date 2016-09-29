# -*- coding: utf-8 -*-
# Generated by Django 1.9 on 2016-09-29 18:16
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Article',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('header', models.CharField(max_length=128, verbose_name='\u0417\u0430\u0433\u043e\u043b\u043e\u0432\u043e\u043a')),
                ('body', models.TextField(max_length=8192, verbose_name='\u0422\u0435\u043a\u0441\u0442')),
                ('create_date', models.DateTimeField(auto_now_add=True, verbose_name='\u0414\u0430\u0442\u0430 \u0441\u043e\u0437\u0434\u0430\u043d\u0438\u044f')),
                ('change_date', models.DateTimeField(auto_now=True, verbose_name='\u0414\u0430\u0442\u0430 \u0438\u0437\u043c\u0435\u043d\u0435\u043d\u0438\u044f')),
                ('meta_name_description', models.CharField(max_length=256, verbose_name="\u0421\u043e\u0434\u0435\u0440\u0436\u0438\u043c\u043e\u0435 meta name='description'")),
                ('meta_name_keywords', models.CharField(max_length=256, verbose_name="\u0421\u043e\u0434\u0435\u0440\u0436\u0438\u043c\u043e\u0435 meta name='keywords'")),
            ],
            options={
                'verbose_name': '\u0421\u0442\u0430\u0442\u044c\u044f',
                'verbose_name_plural': '\u0421\u0442\u0430\u0442\u044c\u0438',
            },
        ),
        migrations.CreateModel(
            name='Author',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=128, verbose_name='\u0418\u043c\u044f')),
                ('surname', models.CharField(max_length=128, verbose_name='\u0424\u0430\u043c\u0438\u043b\u0438\u044f')),
                ('patronymic', models.CharField(max_length=128, verbose_name='\u041e\u0442\u0447\u0435\u0441\u0442\u0432\u043e')),
                ('email', models.EmailField(max_length=254, verbose_name='Email')),
                ('phone', models.CharField(max_length=11, verbose_name='\u0422\u0435\u043b\u0435\u0444\u043e\u043d, \u2116')),
            ],
            options={
                'verbose_name': '\u0410\u0432\u0442\u043e\u0440',
                'verbose_name_plural': '\u0410\u0432\u0442\u043e\u0440\u044b',
            },
        ),
        migrations.CreateModel(
            name='Tag',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=128, verbose_name='\u0422\u0435\u0433')),
                ('articles', models.ManyToManyField(related_name='tags_reverse', to='fgs_blog.Article', verbose_name='\u0422\u0435\u0433\u0438')),
            ],
            options={
                'verbose_name': '\u0422\u0435\u0433',
                'verbose_name_plural': '\u0422\u0435\u0433\u0438',
            },
        ),
        migrations.AddField(
            model_name='article',
            name='authors',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='fgs_blog.Author', verbose_name='\u0410\u0432\u0442\u043e\u0440\u044b'),
        ),
        migrations.AddField(
            model_name='article',
            name='tags',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='fgs_blog.Tag', verbose_name='\u0422\u0435\u0433\u0438'),
        ),
    ]
