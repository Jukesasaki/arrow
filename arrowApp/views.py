import sys

from django.shortcuts import render, redirect
from arrowApp import form
from arrowApp.models import User
from level import user_action_logic as ual
from level.user_action_logic import pass_match
from util.decorator import login_filter, session_filter
from logic.detail_logic import knn_logic
from logic.target_data_create import form_data_logic
from util import log_util


@login_filter
def login(request):
    log_util.log_util(sys._getframe().f_code.co_name)
    d = {'form': form.CheckForm(),
         'session': request.session['user'][0]['level']
         }
    return render(request, 'main.html', d)


@session_filter
def logout(request):
    log_util.log_util(sys._getframe().f_code.co_name)
    request.session.clear()
    return render(request, 'logout.html')


@session_filter
def index(request):
    log_util.log_util(sys._getframe().f_code.co_name)
    request.session.clear()
    return render(request, 'index.html')


@session_filter
def result(request):
    log_util.log_util(sys._getframe().f_code.co_name)

    form_data = form_data_logic(request.POST)

    customer_type = knn_logic(form_data)

    type_str = customer_type[0]
    keyword_str = customer_type[1]

    d = {
        'typ_name': type_str[0],
        'type': type_str[1],
        'keyword': keyword_str,
        'session': request.session['user'][0]['level']
    }
    return render(request, 'result.html', d)


@session_filter
def redirect_view(request):
    log_util.log_util(sys._getframe().f_code.co_name)
    return redirect('http://localhost:8080/')


@session_filter
def create_user_view(request):
    log_util.log_util(sys._getframe().f_code.co_name)
    u = User.objects.all().values('id', 'name', 'level')

    d = {'form': form.CreateUserForm(),
         'user_table': u,
         }
    return render(request, 'user_create.html', d)


@session_filter
def update_user_view(request):
    log_util.log_util(sys._getframe().f_code.co_name)

    d = {'form': form.UpdateUserForm(),
         'id': request.POST['id']
         }
    return render(request, 'user_update.html', d)


@session_filter
def user_create_judge(request):
    log_util.log_util(sys._getframe().f_code.co_name)
    if pass_match(request.POST) == 'error':
        u = User.objects.all().values('id', 'name', 'level')
        d = {
            'form': form.CreateUserForm(),
            'user_table': u,
            'message': 'パスが一致しません'
        }
        return render(request, 'user_create.html', d)
    if ual.insert(request.POST) == 'error':
        return render(request, 'user_fail.html')
    else:
        return render(request, 'user_success.html')


@session_filter
def user_delete_judge(request):
    log_util.log_util(sys._getframe().f_code.co_name)
    if ual.delete(request.POST) == 'error':
        return render(request, 'user_fail.html')
    else:
        return render(request, 'user_success.html')


@session_filter
def user_update_judge(request):
    log_util.log_util(sys._getframe().f_code.co_name)
    if pass_match(request.POST) == 'error':
        d = {
            'form': form.UpdateUserForm(),
            'id': request.POST['id'],
            'message': 'パスが一致しません'
        }
        return render(request, 'user_update.html', d)
    if ual.update(request.POST) == 'error':
        return render(request, 'user_fail.html')
    else:
        return render(request, 'user_success.html')
