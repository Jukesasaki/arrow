from django.urls import path
from arrowApp import views

urlpatterns = [
    path('', views.index, name='index'),
    path('login', views.login, name='login'),
    path('result', views.result, name='result'),
    path('logout', views.logout, name='logout'),
    path('redirect', views.redirect_view, name='redirect'),
    path('create', views.create_user_view, name='create'),
    path('update', views.update_user_view, name='update'),
    path('j_in', views.user_create_judge, name='j_in'),
    path('j_up', views.user_update_judge, name='j_up'),
    path('j_del', views.user_delete_judge, name='j_del'),
]
