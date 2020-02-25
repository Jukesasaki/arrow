import random as rnd
import sys

from arrowApp.models import Customer
from dev import customer_input
from util import log_util


def customer_export():
    log_util.log_util(sys._getframe().f_code.co_name)
    dataList = customer_input.customer_csv_input()

    for i in range(100):
        Customer.objects.create(age=rnd.choice(dataList[0]),
                                sex=rnd.choice(dataList[1]),
                                emo=rnd.choice(dataList[2]),
                                od=rnd.choice(dataList[3]),
                                intention=rnd.choice(dataList[4]),
                                personality=rnd.choice(dataList[5]),
                                act=rnd.choice(dataList[6]),
                                word=rnd.choice(dataList[7])
                                )
