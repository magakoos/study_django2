# coding=utf-8
from django.contrib import admin
from .models import Article, Author, Tag


class ArticleAdmin(admin.ModelAdmin):
    fieldsets = (
        ('Статья',{
            'fields': ('header', 'body',)
        }),
        ('Теги',{
            'fields': ('tags',)
        }),
        ('Meta_tag', {
            'classes': ('collapse', ),
            'fields': (('meta_name_description', 'meta_name_keywords'),),
        })
    )
    exclude = ('create_date', 'change_date',)
    filter_horizontal = ('tags',)


class AuthorAdmin(admin.ModelAdmin):
    pass
fieldsets = (
    ('ФИО', {
        'fields': ('name', 'surname', 'patronymic')
    }),
    ('Контакты',{
        'fields': ('email', 'phone')
    }),
)


class TagAdmin(admin.ModelAdmin):
    fieldsets = (
        (None, {
            'fields': ('name',)
        }),
    )

admin.site.register(Article, ArticleAdmin)
admin.site.register(Author, AuthorAdmin)
admin.site.register(Tag, TagAdmin)
