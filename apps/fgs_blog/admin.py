# coding=utf-8
from django.contrib import admin
from .models import Article, Author, Tag


class TagsInline(admin.StackedInline):
    model = Tag.articles.through
    exclude = ('articles',)


class ArticleAdmin(admin.ModelAdmin):
    readonly_fields = ('create_date', 'change_date', )
    fieldsets = (
        ('Статья', {
            'fields': ('header', 'body',)
        }),
        ('Хронололия', {
            'classes': ('collapse',),
            'fields': ('create_date', 'change_date', )
        }),
        ('Meta_tag', {
            'classes': ('collapse', ),
            'fields': (('meta_name_description', 'meta_name_keywords'),),
        })
    )
    inlines = [
        TagsInline,
    ]


class AuthorAdmin(admin.ModelAdmin):
    fieldsets = (
        ('ФИО', {
            'fields': ('name', 'surname', 'patronymic')
        }),
        ('Контакты',{
            'fields': ('email', 'phone')
        }),
    )


class TagAdmin(admin.ModelAdmin):
    fields = ('name', 'articles')
    filter_horizontal = ('articles',)

admin.site.register(Article, ArticleAdmin)
admin.site.register(Author, AuthorAdmin)
admin.site.register(Tag, TagAdmin)
