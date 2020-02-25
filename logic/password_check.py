from arrowApp.models import User
from logic import crypto_logic as cl


def pass_check(args):
    try:
        user_li = User.objects.all().values('name', 'password')
        for enc_data in user_li:
            if (cl.dec(enc_data['password']) == args['pass']) \
                    and (enc_data['name'] == args['name']):
                return User.objects.all().filter(password=enc_data['password']) \
                    .values('name', 'password', 'level')
        return 'IDまたはパスが違います'
    except KeyError:
        pass
