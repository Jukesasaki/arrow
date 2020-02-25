import sys

import pandas as pd
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
    xy_data = Data.objects.all().values('x', 'y')
    df = pd.DataFrame(data=xy_data, columns=['x', 'y'])
    color = []
    for i in range(len(df)):
        color.append(type_check(df['x'].values[i], df['y'].values[i]))
    for i, key in enumerate(color, 1):
        Data.objects.filter(id=i).update_or_create(c_type=key)
