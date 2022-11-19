from django.contrib import admin
from django.urls import path
from .views import *

urlpatterns = [
    path('login/', login_req, name='login'),
    path('logout/', logout_req, name='logout'),
    path('registration/', registration, name='registration'),
    path('', home, name='home'),
    path('search/', search, name='search'),
    path('filter/', filter, name='filter'),
    path('sort/', sort, name='sort'),
    path('create_activity/', create_activity, name='create_activity'),
    path('edit_activity/', edit_activity, name='edit_activity'),
    path('create_comment/', create_comment, name='create_comment'),
    path('join_activity/', join_activity, name='join_activity'),
    path('edit_user/', edit_user, name='edit_user'),
    path('get_activity/', getActivity, name='getActivity'),
]