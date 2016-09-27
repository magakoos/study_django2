# coding=utf-8

# Django settings for prestart_blog project.

from django.conf.global_settings import *    # pylint: disable=W0614,W0401
import os
import sys


try:
    virtualenv_root = os.environ['VIRTUAL_ENV']
except KeyError:
    sys.stderr.write('Error: virtualenv does not activated.\n')
    sys.exit(1)

VAR_ROOT = os.path.join(virtualenv_root, 'var')

if not os.path.exists(VAR_ROOT):
    os.mkdir(VAR_ROOT)

PROJECT_ROOT = os.path.dirname(os.path.abspath(__file__))

sys.path.insert(0, os.path.join(PROJECT_ROOT, 'apps'))


TIME_ZONE = 'Asia/Vladivostok'

LANGUAGE_CODE = 'ru'

USE_I18N = True

USE_L10N = True

USE_TZ = False

MEDIA_ROOT = os.path.join(VAR_ROOT, 'media')

MEDIA_URL = '/media/'

STATIC_ROOT = os.path.join(VAR_ROOT, 'static')

STATIC_URL = '/static/'

STATICFILES_DIRS = (
    os.path.join(PROJECT_ROOT, 'static'),
)

SECRET_KEY = 'ynu7d9s2%2ltp#)joobmz_1edt^3tmle581b@k+a11=0wnu%3b'

ROOT_URLCONF = 'urls'

TEMPLATE_DIRS = (
    os.path.join(PROJECT_ROOT, 'templates'),
)

INSTALLED_APPS = (
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'fgs_blog',
)

MIDDLEWARE_CLASSES = (
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
)

TEMPLATE_CONTEXT_PROCESSORS += (
)

AUTHENTICATION_BACKENDS += (
)

EMAIL_HOST = ''
EMAIL_PORT = 25
EMAIL_HOST_USER = ''
EMAIL_HOST_PASSWORD = ''
EMAIL_USE_TLS = True
SERVER_EMAIL = ''
DEFAULT_FROM_EMAIL = ''

#==============================================================================
# App settings
#==============================================================================

# Specifically for FileBrowser
if not os.path.exists(MEDIA_ROOT):
    os.mkdir(MEDIA_ROOT)
if not os.path.exists(os.path.join(MEDIA_ROOT, 'uploads')):
    os.mkdir(os.path.join(MEDIA_ROOT, 'uploads'))
