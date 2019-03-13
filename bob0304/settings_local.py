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
        'NAME': 'test_status_db',
        'USER': 'status_db',
        'PASSWORD': 'segASFNb63qsdb',
        'HOST': '127.0.0.1',
        'PORT': '3307',
        'CONN_MAX_AGE': 2000,
        # 'OPTIONS':      {
        #     'init_command': "SET sql_mode='STRICT_TRANS_TABLES'; SET innodb_strict_mode=1",
        #     'charset':      'utf8mb4'
        # }
    },
    'status99': {
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

WEBSERVICE = {
    'HOST' : 'https://status-m.com.ua/ws/',
    'USER' : 'wser',
    'PASSWORD' : 'a1s2d3f4g5h6',

    'PRODUCT_SEARCH': 'ProductSearch_new.1cws?wsdl',
}

LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'formatters': {
        'verbose': {
            'format': '{levelname} {asctime} {module} {process:d} {thread:d} {message}',
            'style': '{',
        },
        'simple': {
            'format': '{levelname} {module} - {message}',
            'style': '{',
        },
        # 'simpledb': {
        #     'format': '{sql} - выполнялся {duration}',
        #     'style': '{',
        # },
    },
    'filters': {
    #     'special': {
    #         '()': 'project.logging.SpecialFilter',
    #         'foo': 'bar',
    #     },
        'require_debug_true': {
            '()': 'django.utils.log.RequireDebugTrue',
        },
    },
    # debug.info.warning.error.critical
    'handlers': {
        'console': {
            # 'level': 'INFO',
            'level': 'DEBUG',
            # 'filters': ['require_debug_true'],
            'class': 'logging.StreamHandler',
            'formatter': 'simple'
        },
        # 'mail_admins': {
        #     'level': 'ERROR',
        #     'class': 'django.utils.log.AdminEmailHandler',
        #     'filters': ['special']
        # },
        'file': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'filename': 'debug.log',
            'encoding': 'utf-8',
            'formatter': 'verbose'
        },
        # 'consoledb': {
        #     'level': 'INFO',
            # 'level': 'DEBUG',
            # 'filters': ['require_debug_true'],
            # 'class': 'logging.StreamHandler',
            # 'formatter': 'simpledb'
        # },

    },
    'loggers': {
        'django': {
            'handlers': ['console'],
            'propagate': True,
        },
        'django.request': {
            # 'handlers': ['mail_admins'],
            'handlers': ['console'],
            'level': 'ERROR',
            'propagate': False,
        },
        # 'myproject.custom': {
        #     'handlers': ['console', 'mail_admins'],
        #     'level': 'INFO',
        #     'filters': ['special']
        # },
        'common': {
            'handlers': ['file', 'console'],
            'level': 'DEBUG',
            'propagate': True,
        },
        'django.db.backends': {
            'handlers': ['file'],
            'level': 'DEBUG',
            'propagate': True,
        },
    }
}

LANGUAGE_CODE = 'ru-ru'

TIME_ZONE = 'Europe/Kiev'
