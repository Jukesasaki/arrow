from django.shortcuts import render

from logic.password_check import pass_check
from util import log_util


# ＧＥＴリクエストかＰＯＳＴリクエストかの振るい分け
# ＰＯＳＴかつセッションが存在すればファンクションを実行
# セッションがなければログイン認証だと判断しＤＢから複合化を行う
# 認証すればINT(0以上)が返ってくるためファンクション実行
# 失敗すればINT(0未満)が返ってくるためindex.htmlへ遷移
def login_filter(func):
    def login_judge(request):
        log_util.log_util(request.method)
        print(type(request.session.get('user')))
        try:
            if request.method == 'GET':
                return render(request, 'index.html')
            if request.method == 'POST':
                if isinstance(request.session.get('user'), int):
                    return func(request)
                user = pass_check(request.POST)
                print(user)
                if user >= 0:
                    request.session['user'] = user
                    return func(request)
                else:
                    request.session.clear()
                    d = {'message': 'IDまたはパスが違います'}
                    return render(request, 'index.html', d)
        # except RequestException as e:
        #     request.session.clear()
        #     d = {'except': e}
        #     return render(request, 'fail.html', d)
        except:
            request.session.clear()
            d = {'except': '認証失敗'}
            return render(request, 'fail.html', d)

    return login_judge


# ＧＥＴリクエストかＰＯＳＴリクエストかの振るい分け
# ＰＯＳＴかつセッションが存在すればファンクションを実行
# セッションがなければセッションエラーとし、fail.htmlへ遷移
def session_filter(func):
    def session_judge(request):
        log_util.log_util(request.method)
        print(request.session.get('user'))
        try:
            if request.method == 'GET':
                return render(request, 'index.html')
            if request.method == 'POST':
                if isinstance(request.session.get('user'), int):
                    return func(request)
                elif request.session.get('user'):
                    d = {'except': 'セッションエラー'}
                    return render(request, 'fail.html', d)
        # except RequestException as e:
        #     request.session.clear()
        #     d = {'except': e}
        #     return render(request, 'fail.html', d)
        except:
            request.session.clear()
            d = {'except': '認証失敗'}
            return render(request, 'fail.html', d)

    return session_judge
