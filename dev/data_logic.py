import sys

from arrowApp.models import Customer, Data
from util import log_util


def data_logic(data):
    x = 0
    y = 0
    x += 40 - int(data.age)
    y += (40 - int(data.age)) * 1.75
    if data.sex == "男":
        x -= 10
        y -= 10
    else:
        x += 10
        y += 10
    if data.emo == "理性的":
        x += 3
        y -= 7
    else:
        x -= 3
        y += 7
    if data.od == "攻め":
        x -= 11
        y += 7
    else:
        x += 11
        y -= 7
    if data.intention == "上昇志向":
        x -= 7
        y -= 4
    else:
        x += 7
        y += 4
    if data.personality == "個性的":
        x += 6
        y += 1
    else:
        x -= 6
        y -= 1
    if data.act == "行動派":
        x -= 8
        y += 1
    else:
        x += 8
        y -= 1
    Data.objects.update_or_create(
        x=x,
        y=y,
        word=data.word
    )
    log_util.log_util("データ化完了（ID：{}）".format(data.id))


def data_input():
    log_util.log_util(sys._getframe().f_code.co_name)
    custom = Customer.objects.all()
    for c in custom:
        data_logic(c)
