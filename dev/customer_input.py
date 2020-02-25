import csv
import sys

from util import log_util


def customer_csv_input():
    log_util.log_util(sys._getframe().f_code.co_name)
    with open(r'static\customerData.csv', encoding="utf-8") as fr:
        reader = csv.reader(fr)
        dataList = [row for row in reader]
        return dataList
