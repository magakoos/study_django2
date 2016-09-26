# -*- coding: utf-8 -*-
# Generated by Django 1.9 on 2016-09-17 09:31
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('fgs_blog', '0004_auto_20160916_0057'),
    ]

    operations = [
        migrations.CreateModel(
            name='Article',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('header', models.CharField(max_length=128, verbose_name=b'\xd0\x97\xd0\xb0\xd0\xb3\xd0\xbe\xd0\xbb\xd0\xbe\xd0\xb2\xd0\xbe\xd0\xba')),
                ('body', models.CharField(max_length=8192, verbose_name=b'\xd0\xa2\xd0\xb5\xd0\xba\xd1\x81\xd1\x82')),
                ('create_date', models.DateTimeField(auto_now_add=True, verbose_name=b'\xd0\x94\xd0\xb0\xd1\x82\xd0\xb0 \xd1\x81\xd0\xbe\xd0\xb7\xd0\xb4\xd0\xb0\xd0\xbd\xd0\xb8\xd1\x8f')),
                ('change_date', models.DateTimeField(auto_now=True, verbose_name=b'\xd0\x94\xd0\xb0\xd1\x82\xd0\xb0 \xd0\xb8\xd0\xb7\xd0\xbc\xd0\xb5\xd0\xbd\xd0\xb5\xd0\xbd\xd0\xb8\xd1\x8f')),
            ],
        ),
        migrations.CreateModel(
            name='Author',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=128, verbose_name=b'\xd0\x98\xd0\xbc\xd1\x8f')),
                ('surname', models.CharField(max_length=128, verbose_name=b'\xd0\xa4\xd0\xb0\xd0\xbc\xd0\xb8\xd0\xbb\xd0\xb8\xd1\x8f')),
                ('email', models.EmailField(max_length=254, verbose_name=b'Email')),
                ('phone', models.CharField(max_length=11, verbose_name=b'\xd0\xa2\xd0\xb5\xd0\xbb\xd0\xb5\xd1\x84\xd0\xbe\xd0\xbd, \xe2\x84\x96')),
            ],
        ),
        migrations.CreateModel(
            name='Tag',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=128, verbose_name=b'Meta Tag')),
                ('articles', models.ManyToManyField(to='fgs_blog.Article')),
            ],
        ),
        migrations.RemoveField(
            model_name='articles',
            name='fk_article',
        ),
        migrations.RemoveField(
            model_name='articles',
            name='fk_author',
        ),
        migrations.DeleteModel(
            name='Articles',
        ),
        migrations.DeleteModel(
            name='Authors',
        ),
        migrations.DeleteModel(
            name='Tags',
        ),
        migrations.AddField(
            model_name='article',
            name='authors',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='fgs_blog.Author'),
        ),
    ]