import sys

from arrowApp.models import Data
from util import log_util


def type_check(x, y):
    log_util.log_util(sys._getframe().f_code.co_name)

    if (x <= 0) and (y >= 0):
        typ = 'e'
    elif (x >= 0) and (y >= 0):
        typ = 'am'
    elif (x <= 0) and (y <= 0):
        typ = 'd'
    elif (x >= 0) and (y <= 0):
        typ = 'a'
    else:
        typ = 'ex'

    return typ


def customer_type_create():
    log_util.log_util(sys._getframe().f_code.co_name)
    data = Data.objects.all().values('x', 'y')
    color = []
    print(range(len(data)))
    for i in range(len(data)):
        color.append(type_check(data[i]['x'], data[i]['y']))
        print(i, 'とは：', data[i]['x'], data[i]['y'])
    for n, key in enumerate(color):
        Data.objects.filter(id=n+1).update(c_type=key)
