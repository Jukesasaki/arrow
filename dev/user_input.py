import sys

from arrowApp.models import User
from logic.crypto_logic import pass_create
from util import log_util


def user_input_pre():
    log_util.log_util(sys._getframe().f_code.co_name)
    User.objects.create(
        name='admin',
        password=pass_create('admin'),
        level=0
    )
