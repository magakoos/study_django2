# coding=utf-8
from django.db import models
from django.utils.encoding import python_2_unicode_compatible
# Create your models here.


@python_2_unicode_compatible
class Author(models.Model):
    """
    Автор статьи в блоге.
    """
    name = models.CharField(verbose_name=u"Имя", max_length=128)
    surname = models.CharField(verbose_name=u"Фамилия", max_length=128)
    patronymic = models.CharField(verbose_name=u"Отчество", max_length=128)
    email = models.EmailField(verbose_name=u"Email")
    phone = models.CharField(verbose_name=u"Телефон, №", max_length=11)

    class Meta:
        verbose_name = u"Автор"
        verbose_name_plural = u"Авторы"

    def __str__(self):
        return u"{email}: {name} {surname}".format(
            email=self.email,
            name=self.name,
            surname=self.surname
        )


@python_2_unicode_compatible
class Tag(models.Model):
    """
    Тег для статьи.
    """
    name = models.CharField(verbose_name=u"Meta Tag", max_length=128)

    class Meta:
        verbose_name = u"Тег"
        verbose_name_plural = u"Теги"

    def __str__(self):
        return u"{name}".format(
            name=self.name
        )


@python_2_unicode_compatible
class Article(models.Model):
    """
    Статья в блоге.
    """
    authors = models.ForeignKey(Author, verbose_name=u"Авторы")
    tags = models.ManyToManyField(
        Tag,
        verbose_name=u"Теги"
    )
    header = models.CharField(verbose_name=u"Заголовок", max_length=128)
    body = models.TextField(verbose_name=u"Текст", max_length=8192)
    create_date = models.DateTimeField(
        verbose_name=u"Дата создания",
        auto_now_add=True
    )
    change_date = models.DateTimeField(
        verbose_name=u"Дата изменения",
        auto_now=True
    )
    meta_name_description = models.CharField(
        verbose_name=u"Содержимое meta name='description'",
        max_length=256
    )
    meta_name_keywords = models.CharField(
        verbose_name=u"Содержимое meta name='keywords'",
        max_length=256
    )

    class Meta:
        verbose_name = u"Статья"
        verbose_name_plural = u"Статьи"

    def __str__(self):
        return u'{header} написаную {author}'.format(
            header=self.header,
            author=''
        )
