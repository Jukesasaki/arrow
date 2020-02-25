from arrowApp.models import User
from logic.crypto_logic import pass_create


def user_input_pre():
    User.objects.create(
        name='admin',
        password=pass_create('admin'),
        level=0
    )
