import re
from django.contrib.auth import authenticate, login, logout
from django.http import *
from django.shortcuts import *
from django.views.decorators.csrf import *
from django.contrib.auth.hashers import *
from django.db.models import Q
from rest_framework import status

from .models import *


@csrf_exempt
def login_req(request: HttpRequest):

    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(username=username, password=password)
        if user:
            login(request, user)
            return JsonResponse({'username': username, 'password': password})
        else:
            return JsonResponse({'username': '', 'password': ''},  status=status.HTTP_400_BAD_REQUEST)
    else:
        return JsonResponse({'username': '', 'password': ''},  status=status.HTTP_400_BAD_REQUEST)


@csrf_exempt
def logout_req(request: HttpRequest):
    logout(request)
    return JsonResponse({})


@csrf_exempt
def registration(request: HttpRequest):

    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']

        if not re.fullmatch(r'[A-Za-z0-9@#$%^&+=]{8,}', password):
            return JsonResponse({'msg': 'ERROR: The password is not valid.'}, status=status.HTTP_400_BAD_REQUEST)

        first_name = request.POST['first_name']
        last_name = request.POST['last_name']
        email = request.POST['email']

        if not re.search(r"^[A-Za-z0-9_!#$%&'*+\/=?`{|}~^.-]+@[A-Za-z0-9.-]+$", email):
            return JsonResponse({'msg': 'ERROR: The email address is not valid.'}, status=status.HTTP_400_BAD_REQUEST)

        user = Users(username=username, password=make_password(password), email=email, first_name=first_name, last_name=last_name)
        u = Users.objects.filter(username=username).first()

        if u is not None:
            return JsonResponse({'idu': ''}, status=status.HTTP_400_BAD_REQUEST)
        else:
            user.save()
            login(request, user)
            return JsonResponse({'idu': user.idu})
    else:
        return JsonResponse({'idu': ''},  status=status.HTTP_400_BAD_REQUEST)


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
        temp_dict['user_founder'] = a.idu.idu
        act.append(temp_dict)

    return JsonResponse({'act': act})


@csrf_exempt
def search(request: HttpRequest):

    word = request.POST['word']

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
        temp_dict['user_founder'] = a.idu.idu
        act.append(temp_dict)

    return JsonResponse({'act': act})


@csrf_exempt
def filter(request: HttpRequest):

    type = request.POST.get('type')
    meeting_point = request.POST.get('meeting_point')

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
        temp_dict['user_founder'] = a.idu.idu
        act.append(temp_dict)

    return JsonResponse({'act': act})


@csrf_exempt
def sort(request: HttpRequest):

    word = request.POST.get('word')

    sortWord = ''
    asc = request.POST.get('asc')
    if asc == '-':
        sortWord += str(asc)

    activities = Activity.objects.order_by(sortWord+str(word)).all()

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
        temp_dict['user_founder'] = a.idu.idu
        act.append(temp_dict)

    return JsonResponse({'act': act})


@csrf_exempt
def create_activity(request: HttpRequest):

    if request.method == 'POST':
        title = request.POST['title']
        desc = request.POST['desc']
        mp = request.POST['meeting_point']
        st = request.POST['start_time']
        duration = request.POST['duration']
        minp = request.POST['min_people']
        maxp = request.POST['max_people']
        type = Type.objects.filter(name=request.POST['typeName']).first()
        user = request.user
        activ = Activity(title=title, desc=desc, meetingpoint=mp, start_time=st, duration=duration,
                         minpeople=minp, maxpeople=maxp, idt=type, idu=user)
        activ.save()
        return JsonResponse({'ida': activ.ida})
    else:
        return JsonResponse({'ida': ''},  status=status.HTTP_400_BAD_REQUEST)


@csrf_exempt
def create_comment(request: HttpRequest):

    if request.method == 'POST':
        desc = request.POST['desc']
        activ = Activity.objects.filter(ida=request.POST['ida']).first()
        user = request.user
        comment = Comment(desc=desc, idu=user, ida=activ)
        comment.save()
        return JsonResponse({'idc': comment.idc})
    else:
        return JsonResponse({'idc': ''},  status=status.HTTP_400_BAD_REQUEST)


@csrf_exempt
def join_activity(request: HttpRequest):

    if request.method == 'POST':
        activ = Activity.objects.filter(ida=request.POST['ida']).first()
        user = request.user
        ua = UserActivity(ida=activ, idu=user)
        uatmp = UserActivity.objects.filter(idu=user).filter(ida=activ).first()

        if uatmp or activ is None:
            return JsonResponse({'idc': ''}, status=status.HTTP_400_BAD_REQUEST)
        else:
            ua.save()
            return JsonResponse({'idua': ua.idua})
    else:
        return JsonResponse({'idc': ''}, status=status.HTTP_400_BAD_REQUEST)


@csrf_exempt
def edit_activity(request: HttpRequest):

    if request.method == 'POST':
        activ = Activity.objects.filter(ida=request.POST['ida']).first()
        activ.title = request.POST['title']
        activ.desc = request.POST['desc']
        activ.meetingpoint = request.POST['meeting_point']
        activ.start_time = request.POST['start_time']
        activ.duration = request.POST['duration']
        activ.minpeople = request.POST['min_people']
        activ.maxpeople = request.POST['max_people']
        activ.idt = Type.objects.filter(name=request.POST['typeName']).first()

        activ.save()
        return JsonResponse({'ida': activ.ida})
    else:
        return JsonResponse({'ida': ''},  status=status.HTTP_400_BAD_REQUEST)


@csrf_exempt
def edit_user(request: HttpRequest):

    if request.method == 'POST':

        user = Users.objects.filter(idu=request.POST['idu']).first()
        user.username = request.POST['username']
        user.password = make_password(request.POST['password'])
        user.first_name = request.POST['first_name']
        user.last_name = request.POST['last_name']
        user.email = request.POST['email']

        user.save()
        return JsonResponse({'idu': user.idu})
    else:
        return JsonResponse({'idu': ''},  status=status.HTTP_400_BAD_REQUEST)