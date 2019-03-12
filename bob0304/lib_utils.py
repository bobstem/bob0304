import logging
import re
import hashlib

from django.db import connections
from django.conf import settings

logger_other = logging.getLogger('other')


def only_letters_and_digits(string):
    if string is None:
        return ''

    string = re.sub(r'([^\w]|_)', '', string).strip()
    return string

def str_to_int(string):
    if string is None:
        return 0
    return int(float(string.replace(',', '.')))




def clear_str(string):
    # Чистит невидимые символы, строку не меняет
    if string is None:
        return ''

    string = str(string)
    string = re.sub(r'[^\S ]', '', string)
    string = string.strip()

    return string


def clear_float(string):
    string = clear_str(string)

    if string == '':
        return float(0)

    return float(re.sub(r'[^\d.,-]', '', string).replace(',', '.'))


def clear_int(string):
    string = clear_str(string)

    if string == '':
        return int(0)

    return int(re.sub(r'[^\d-]', '', string))


def clear_bool(string):
    string = clear_str(string)

    if string == '':
        return False

    if string in ['true', '1', 'True']:
        return True

    return False


def slash_always_on_end_url(url: str = ''):
    # В конце урл всегда слеш
    if re.match('^.+/$', url) is None:
        return url + '/'
    else:
        return url


def dict_fetch_all(cursor):
    # Возвращает в виде словаря запроc к mysql
    desc = cursor.description
    return [
        dict(zip([col[0] for col in desc], row))
        for row in cursor.fetchall()
    ]


def get_client_ip(request):
    x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')

    if x_forwarded_for:
        ip = x_forwarded_for.split(',')[0]
    else:
        ip = request.META.get('REMOTE_ADDR')
    return ip


def cache_key(*args):
    key = ''

    for item in args:
        key += str(item)

    key = hashlib.sha256(key.encode('utf8')).hexdigest()

    return key
