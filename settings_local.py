# coding=utf-8

from settings_base import *    # pylint: disable=W0614,W0401


DEBUG = True
TEMPLATE_DEBUG = DEBUG

ALLOWED_HOSTS = []

DATABASES = {
    'default': {
        # 'ENGINE': 'django.db.backends.sqlite3',
        # 'NAME': os.path.join(VAR_ROOT, 'dev.db'),
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'fgs',
        'USER': 'fgs',
        'PASSWORD': 'password',
        'HOST': 'localhost',
        'PORT': '',
    }
}

