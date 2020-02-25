from datetime import date

from django.utils import timezone
from django.utils.timezone import localtime


def log_util(string):
    now = localtime(timezone.now())
    message = "{}+++{}".format(now.isoformat(), string)
    print(message)
