# Internationalization
# https://docs.djangoproject.com/en/2.1/topics/i18n/
import os

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


# DATABASES = {
#     'default': {
#         'ENGINE': 'django.db.backends.mysql',
#         'NAME': 'tsd_db',
#         'USER': 'tsd_db',
#         'PASSWORD': 't7Fa46rEF7',
#         'HOST': 'try.stemsc.com',
#         'PORT': '13306',
#     }
# }
DATABASE_ROUTERS = ['bob0304.dbrouter.DbRouter', ]

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'dddjango',
        'USER': 'root',
        'PASSWORD': '',
        'HOST': 'localhost',
        'PORT': '3306',
        # 'client_encoding': 'UTF8'
    },
    'status': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'web_users',
        'USER': 'web_users',
        'PASSWORD': 'users911',
        'HOST': '80.92.233.198',
        'PORT': '13306',
        'CONN_MAX_AGE': 2000,
        # 'OPTIONS':      {
        #     'init_command': "SET sql_mode='STRICT_TRANS_TABLES'; SET innodb_strict_mode=1",
        #     'charset':      'utf8mb4'
        # }
    }
}

LANGUAGE_CODE = 'ru-ru'

TIME_ZONE = 'Europe/Kiev'

USE_I18N = True

USE_L10N = True

USE_TZ = True
