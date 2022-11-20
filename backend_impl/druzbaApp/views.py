import json
import re
from django.contrib.auth import authenticate, login, logout
from django.http import *
from django.shortcuts import *
from django.views.decorators.csrf import *
from django.contrib.auth.hashers import *
from django.db.models import Q
from rest_framework import status
import requests

from .models import *


@csrf_exempt
def login_req(request: HttpRequest):
    if request.method == 'POST':
        json_body = json.loads(request.body)
        username = json_body['username']
        password = json_body['password']
        user = authenticate(username=username, password=password)
        if user:
            login(request, user)
            idu = user.idu
            return JsonResponse({'idu': idu})
        else:
            return JsonResponse({'idu': -1}, status=status.HTTP_400_BAD_REQUEST)
    else:
        return JsonResponse({'idu': -1}, status=status.HTTP_400_BAD_REQUEST)


@csrf_exempt
def logout_req(request: HttpRequest):
    logout(request)
    return JsonResponse({})


@csrf_exempt
def registration(request: HttpRequest):
    if request.method == 'POST':
        json_body = json.loads(request.body)
        username = json_body['username']
        password = json_body['password']

        if not re.fullmatch(r'[A-Za-z0-9@#$%^&+=]{8,}', password):
            return JsonResponse({'msg': 'ERROR: The password is not valid.', 'idu': ''},
                                status=status.HTTP_400_BAD_REQUEST)

        first_name = json_body['first_name']
        last_name = json_body['last_name']
        email = json_body['email']

        if not re.search(r"^[A-Za-z0-9_!#$%&'*+\/=?`{|}~^.-]+@[A-Za-z0-9.-]+$", email):
            return JsonResponse({'msg': 'ERROR: The email address is not valid.', 'idu': ''},
                                status=status.HTTP_400_BAD_REQUEST)

        user = Users(username=username, password=make_password(password), email=email, first_name=first_name,
                     last_name=last_name)
        u = Users.objects.filter(username=username).first()

        if u is not None:
            return JsonResponse({'idu': ''}, status=status.HTTP_400_BAD_REQUEST)
        else:
            user.save()
            login(request, user)
            return JsonResponse({'idu': user.idu})
    else:
        return JsonResponse({'idu': ''}, status=status.HTTP_400_BAD_REQUEST)


def home(request: HttpRequest):
    activities = Activity.objects.all()
    act = []

    for a in activities:
        temp_dict = {}
        temp_dict['idA'] = a.ida

        typeName = Type.objects.filter(pk=a.idt.idt).first().name

        temp_dict['type'] = typeName
        temp_dict['title'] = a.title
        temp_dict['description'] = a.desc

        num_of_people = len(UserActivity.objects.filter(ida=a.ida))

        temp_dict['num_of_people'] = num_of_people
        temp_dict['meeting_point'] = a.meetingpoint
        temp_dict['time'] = str(a.start_time)
        temp_dict['duration'] = a.duration
        temp_dict['max_people'] = a.maxpeople
        temp_dict['min_people'] = a.minpeople
        temp_dict['user_founder'] = a.idu.username
        act.append(temp_dict)

    return JsonResponse({'act': act})


@csrf_exempt
def search(request: HttpRequest):
    json_body = json.loads(request.body)
    word = json_body['word']

    activities = Activity.objects.filter(title__icontains=word).all()
    act = []

    for a in activities:
        temp_dict = {}
        temp_dict['idA'] = a.ida

        typeName = Type.objects.filter(pk=a.idt.idt).first().name

        temp_dict['type'] = typeName
        temp_dict['title'] = a.title
        temp_dict['description'] = a.desc

        num_of_people = len(UserActivity.objects.filter(ida=a.ida))

        temp_dict['num_of_people'] = num_of_people
        temp_dict['meeting_point'] = a.meetingpoint
        temp_dict['time'] = str(a.start_time)
        temp_dict['duration'] = a.duration
        temp_dict['max_people'] = a.maxpeople
        temp_dict['min_people'] = a.minpeople
        temp_dict['user_founder'] = a.idu.username
        act.append(temp_dict)

    return JsonResponse({'act': act})


@csrf_exempt
def filter(request: HttpRequest):
    json_body = json.loads(request.body)
    type = json_body.get('type')
    meeting_point = json_body.get('meeting_point')

    typeObj = Type.objects.filter(name=type).first()

    activities = Activity.objects.all()

    if type != '':
        activities = activities.filter(idt=typeObj)
    if meeting_point:
        activities = activities.filter(meetingpoint__icontains=meeting_point)

    act = []

    for a in activities:
        temp_dict = {}
        temp_dict['idA'] = a.ida

        typeName = Type.objects.filter(pk=a.idt.idt).first().name

        temp_dict['type'] = typeName
        temp_dict['title'] = a.title
        temp_dict['description'] = a.desc

        num_of_people = len(UserActivity.objects.filter(ida=a.ida))

        temp_dict['num_of_people'] = num_of_people
        temp_dict['meeting_point'] = a.meetingpoint
        temp_dict['time'] = str(a.start_time)
        temp_dict['duration'] = a.duration
        temp_dict['max_people'] = a.maxpeople
        temp_dict['min_people'] = a.minpeople
        temp_dict['user_founder'] = a.idu.username
        act.append(temp_dict)

    return JsonResponse({'act': act})


@csrf_exempt
def sort(request: HttpRequest):
    json_body = json.loads(request.body)
    word = json_body.get('word')

    sortWord = ''
    asc = json_body.get('asc')
    if asc == '-':
        sortWord += str(asc)

    activities = Activity.objects.order_by(sortWord + str(word)).all()

    act = []

    for a in activities:
        temp_dict = {}
        temp_dict['idA'] = a.ida

        typeName = Type.objects.filter(pk=a.idt.idt).first().name

        temp_dict['type'] = typeName
        temp_dict['title'] = a.title
        temp_dict['description'] = a.desc

        num_of_people = len(UserActivity.objects.filter(ida=a.ida))

        temp_dict['num_of_people'] = num_of_people
        temp_dict['meeting_point'] = a.meetingpoint
        temp_dict['time'] = str(a.start_time)
        temp_dict['duration'] = a.duration
        temp_dict['max_people'] = a.maxpeople
        temp_dict['min_people'] = a.minpeople
        temp_dict['user_founder'] = a.idu.username
        act.append(temp_dict)

    return JsonResponse({'act': act})


@csrf_exempt
def create_activity(request: HttpRequest):
    if request.method == 'POST':
        json_body = json.loads(request.body)

        title = json_body['title']
        desc = json_body['desc']
        mp = json_body['meeting_point']
        print(json_body['start_time'])
        st = json_body['start_time']
        duration = int(json_body['duration'])
        minp = int(json_body['min_people'])
        maxp = int(json_body['max_people'])
        type = Type.objects.filter(name=json_body['typeName']).first()
        user = Users.objects.filter(idu=int(json_body['idu'])).first()
        activ = Activity(title=title, desc=desc, meetingpoint=mp, start_time=st, duration=duration,
                         minpeople=minp, maxpeople=maxp, idt=type, idu=user)
        activ.save()
        return JsonResponse({'ida': activ.ida})
    else:
        return JsonResponse({'ida': ''}, status=status.HTTP_400_BAD_REQUEST)


@csrf_exempt
def create_comment(request: HttpRequest):
    if request.method == 'POST':
        json_body = json.loads(request.body)
        desc = json_body['desc']
        activ = Activity.objects.filter(ida=json_body['ida']).first()
        user = request.user
        comment = Comment(desc=desc, idu=user, ida=activ)
        comment.save()
        return JsonResponse({'idc': comment.idc})
    else:
        return JsonResponse({'idc': ''}, status=status.HTTP_400_BAD_REQUEST)


@csrf_exempt
def join_activity(request: HttpRequest):
    if request.method == 'POST':
        json_body = json.loads(request.body)
        activ = Activity.objects.filter(ida=json_body['ida']).first()
        user = Users.objects.filter(idu=json_body['idu']).first()
        uatmp = UserActivity(idu=user, ida=activ)

        uat = UserActivity.objects.filter(ida=activ).filter(idu=user).first()
        num_of_people = len(UserActivity.objects.filter(ida=json_body['ida']))

        if uatmp is None or uat or num_of_people >= activ.maxpeople:
            return JsonResponse({'idua': ''}, status=status.HTTP_400_BAD_REQUEST)
        else:
            uatmp.save()
            return JsonResponse({'idua': uatmp.idua})
    else:
        return JsonResponse({'idc': ''}, status=status.HTTP_400_BAD_REQUEST)


@csrf_exempt
def edit_activity(request: HttpRequest):
    if request.method == 'POST':
        json_body = json.loads(request.body)
        activ = Activity.objects.filter(ida=json_body['ida']).first()
        activ.title = json_body['title']
        activ.desc = json_body['desc']
        activ.meetingpoint = json_body['meeting_point']
        activ.start_time = json_body['start_time']
        activ.duration = json_body['duration']
        activ.minpeople = json_body['min_people']
        activ.maxpeople = json_body['max_people']
        activ.idt = Type.objects.filter(name=json_body['typeName']).first()

        activ.save()
        return JsonResponse({'ida': activ.ida})
    else:
        return JsonResponse({'ida': ''}, status=status.HTTP_400_BAD_REQUEST)


@csrf_exempt
def edit_user(request: HttpRequest):
    if request.method == 'POST':
        json_body = json.loads(request.body)
        user = Users.objects.filter(idu=json_body['idu']).first()
        user.username = json_body['username']
        user.password = make_password(json_body['password'])
        user.first_name = json_body['first_name']
        user.last_name = json_body['last_name']
        user.email = json_body['email']

        user.save()
        return JsonResponse({'idu': user.idu})
    else:
        return JsonResponse({'idu': ''}, status=status.HTTP_400_BAD_REQUEST)


@csrf_exempt
def getActivity(request: HttpRequest):
    json_body = json.loads(request.body)
    ida = json_body['ida']
    a = Activity.objects.filter(ida=ida).first()

    temp_dict = {}
    temp_dict['idA'] = a.ida

    typeName = Type.objects.filter(pk=a.idt.idt).first().name

    temp_dict['type'] = typeName
    temp_dict['title'] = a.title
    temp_dict['description'] = a.desc

    num_of_people = len(UserActivity.objects.filter(ida=a.ida))

    temp_dict['num_of_people'] = num_of_people
    temp_dict['meeting_point'] = a.meetingpoint
    temp_dict['time'] = str(a.start_time)
    temp_dict['duration'] = a.duration
    temp_dict['max_people'] = a.maxpeople
    temp_dict['min_people'] = a.minpeople
    temp_dict['user_founder'] = a.idu.username

    return JsonResponse(temp_dict)
