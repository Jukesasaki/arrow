from django.db import transaction, IntegrityError

from arrowApp.models import User


# USERテーブルへアクセスし処理を行う
from logic.crypto_logic import pass_create


def insert(data):
    try:
        with transaction.atomic():
            User.objects.create(
                name=data['name'],
                password=pass_create(data['password']),
                level=data['level']
            )
            return None
    except IntegrityError:
        transaction.rollback()
        return 'error'


def update(data):
    try:
        with transaction.atomic():
            User.objects.filter(id=data['id']).update(
                password=pass_create(data['password']),
                level=data['level']
            )
            return None
    except IntegrityError:
        transaction.rollback()
        return 'error'


def delete(data):
    try:
        with transaction.atomic():
            User.objects.filter(id=data['id']).delete()
            return None
    except IntegrityError:
        transaction.rollback()
        return 'error'


def pass_match(data):
    if data['password'] == data['password2']:
        return None
    else:
        return 'error'
