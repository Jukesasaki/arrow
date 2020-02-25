from django.shortcuts import render
from requests import RequestException

from logic.password_check import pass_check
from util import log_util


# ＧＥＴリクエストかＰＯＳＴリクエストかの振るい分け
# ＰＯＳＴかつセッションが存在すればファンクションを実行
# セッションがなければログイン認証だと判断しＤＢから複合化を行う
# 認証すればクエリセットが返ってくるためファンクション実行
# 失敗すれば失敗の文字列が返ってくるためindex.htmlへ遷移
def login_filter(func):
    def login_judge(request):
        log_util.log_util(request.method)
        try:
            if request.method == 'GET':
                return render(request, 'index.html')
            if request.method == 'POST':
                if request.session.get('user'):
                    return func(request)
                user = pass_check(request.POST)
                if not isinstance(user, str):
                    request.session['user'] = user
                    return func(request)
                else:
                    d = {'message': user}
                    return render(request, 'index.html', d)
        except RequestException as e:
            request.session.clear()
            d = {'except': e}
            return render(request, 'fail.html', d)

    return login_judge


# ＧＥＴリクエストかＰＯＳＴリクエストかの振るい分け
# ＰＯＳＴかつセッションが存在すればファンクションを実行
# セッションがなければセッションエラーとし、fail.htmlへ遷移
def session_filter(func):
    def session_judge(request):
        log_util.log_util(request.method)
        try:
            if request.method == 'GET':
                return render(request, 'index.html')
            if request.method == 'POST':
                if request.session.get('user'):
                    return func(request)
                else:
                    d = {'except': 'セッションエラー'}
                    return render(request, 'fail.html', d)
        except RequestException as e:
            request.session.clear()
            d = {'except': e}
            return render(request, 'fail.html', d)

    return session_judge
