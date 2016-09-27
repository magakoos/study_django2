# coding=utf-8

from django.conf.urls import patterns, include, url
from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin
from django.views import generic


admin.autodiscover()


urlpatterns = patterns(
    '',
    url(r'^admin/', include(admin.site.urls)),
    url(r'^', include('fgs_blog.urls')),
)
if settings.TEMPLATE_DEBUG:
    urlpatterns += patterns(
        '',
        url(
            r'^404.html$',
            generic.TemplateView.as_view(template_name='404.html')
        ),
        url(
            r'^500.html$',
            generic.TemplateView.as_view(template_name='500.html')
        ),
    )


urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
