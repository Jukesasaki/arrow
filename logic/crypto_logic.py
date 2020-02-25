import base64
from Crypto.Cipher import AES

_KEY = b'SIydsGbtLr5tYhr51p2yePGfR6Kujm3xkfWEGzQ8pUiiJ8JI26x6gcZdHNPSMKbi'
iv = b'\x9c\x0f\xd6\xfc\xa3\x82`PM\xa5{5\\vj\x7f'


def pass_create(pwd):
    try:
        enc_pwd = enc(pwd)
        return enc_pwd
    except TypeError:
        print('WARNING!!暗号化に失敗しました')


def _pad(s):
    size = 16
    pad = b' ' * (size - len(s) % size)
    return s + pad


def enc(pwd):
    key = _pad(_KEY)
    pwd = _pad(pwd.encode('utf-8'))
    key = key[:16]
    aes = AES.new(key, AES.MODE_CBC, iv)
    pwd_cipher = aes.encrypt(pwd)
    return base64.b64encode(pwd_cipher).decode('utf-8')


def dec(enc_pwd):
    key = _pad(_KEY)
    key = key[:16]
    aes = AES.new(key, AES.MODE_CBC, iv)
    enc_pwd = base64.b64decode(enc_pwd)
    pwd = aes.decrypt(enc_pwd)
    pwd = pwd.decode('utf-8')
    pwd = pwd.strip()
    return pwd
