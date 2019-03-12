"""
WSGI config for bob0304 project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/2.1/howto/deployment/wsgi/
"""

import os

from django.core.wsgi import get_wsgi_application

# Если несколько сайтов на Django
# запущены в одном процессе mod_wsgi,
# они все будут использовать настройки сайта,
# который первый загрузился. Это можно исправить, поменяв:

# os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'bob0304.settings')

# в wsgi.py на:
os.environ["DJANGO_SETTINGS_MODULE"] = 'bob0304.settings'


application = get_wsgi_application()
