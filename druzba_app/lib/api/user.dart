import 'dart:convert';

import 'url.dart';
import 'package:http/http.dart' as http;
import '../models/activity.dart';

class UserAPI {
  static Future<bool> checkLogin(String username, String pass) {
    return Future.delayed(
      const Duration(seconds: 1),
      () => true,
    );
  }

  static Future<bool> login(String username, String pass) async {
    final response = await http.post(Uri.parse(API.url + 'login/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
            <String, String>{'password': pass, 'username': username}));
    print(response);
    print(response.body);

    return Future.delayed(
      const Duration(seconds: 1),
      () => false,
    );
  }

  //TODO prebaci u novi fajl jer nije vezano za usera
  static Future<List<Activity>> getActivityList() {
    return Future.delayed(
      const Duration(seconds: 1),
      () => [
        Activity(
            idA: 1,
            title: 'naslov',
            type: 'tip',
            description: 'opis',
            num_of_people: 4,
            meeting_point: 'picka materina',
            time: '5.6.7',
            duration: 3,
            max_people: 10,
            min_people: 2,
            user_founder: 'user_founder'),
        Activity(
            idA: 2,
            title: 'naslov2',
            type: 'ti2p',
            description: 'opis2',
            num_of_people: 4,
            meeting_point: 'pic2ka materina',
            time: '5.6.72',
            duration: 3,
            max_people: 10,
            min_people: 5,
            user_founder: "user_foun2der"),
        Activity(
            idA: 2,
            title: 'naslov6',
            type: 'ti2p',
            description:
                'opis2 pycache__/urls.cpython-39.pyc M backend_impl/druzba/__pycache__/wsgi.cpython-39.pyc M backend_impl/druzba/settings.py M backend_impl/druzbaApp/__pycache__/__init__.cpython-39.pyc M backend_impl/druzbaApp/__pycache__/admin.cpython-39.pyc M backend_impl/druzbaApp/__pycache__/apps.cpython-39.pyc M backend_impl/druzbaApp/__pycache__/models.cpython-39.pyc M backend_impl/druzbaApp/__pycache__/urls.cpython-39.pyc M backend_impl/druzbaApp/__pycache__/views.cpython-39.pyc M backend_impl/druzbaApp/migrations/0001_initial.py D backend_impl/druzbaApp/migrations/0002_comment_idu.py M backend_impl/druzbaApp/migrations/__pycache__/0001_initial.cpython-39.pyc D backend_impl/druzbaApp/migrations/__pycache__/0002_comment_idu.cpython-39.pyc M backend_impl/druzbaApp/migrations/__pycach',
            num_of_people: 4,
            meeting_point: 'pic2ka materina',
            time: '5.6.72',
            duration: 3,
            max_people: 10,
            min_people: 5,
            user_founder: "user_foun2der"),
        Activity(
            idA: 2,
            title: 'naslov2',
            type: 'ti2p',
            description: 'opis2',
            num_of_people: 4,
            meeting_point: 'pic2ka materina',
            time: '5.6.72',
            duration: 3,
            max_people: 10,
            min_people: 5,
            user_founder: "user_foun2der"),
        Activity(
            idA: 2,
            title: 'naslov2',
            type: 'ti2p',
            description: 'opis2',
            num_of_people: 4,
            meeting_point: 'pic2ka materina',
            time: '5.6.72',
            duration: 3,
            max_people: 10,
            min_people: 5,
            user_founder: "user_foun2der"),
        Activity(
            idA: 2,
            title: 'naslov2',
            type: 'ti2p',
            description: 'opis2',
            num_of_people: 4,
            meeting_point: 'pic2ka materina',
            time: '5.6.72',
            duration: 3,
            max_people: 10,
            min_people: 5,
            user_founder: "user_foun2der"),
        Activity(
            idA: 2,
            title: 'naslov2',
            type: 'ti2p',
            description: 'opis2',
            num_of_people: 4,
            meeting_point: 'pic2ka materina',
            time: '5.6.72',
            duration: 3,
            max_people: 10,
            min_people: 5,
            user_founder: "user_foun2der"),
        Activity(
            idA: 2,
            title: 'naslov2',
            type: 'ti2p',
            description: 'opis2',
            num_of_people: 4,
            meeting_point: 'pic2ka materina',
            time: '5.6.72',
            duration: 3,
            max_people: 10,
            min_people: 5,
            user_founder: "user_foun2der"),
        Activity(
            idA: 2,
            title: 'naslov2',
            type: 'ti2p',
            description: 'opis2',
            num_of_people: 4,
            meeting_point: 'pic2ka materina',
            time: '5.6.72',
            duration: 3,
            max_people: 10,
            min_people: 5,
            user_founder: "user_foun2der"),
        Activity(
            idA: 2,
            title: 'naslov2',
            type: 'ti2p',
            description: 'opis2',
            num_of_people: 4,
            meeting_point: 'pic2ka materina',
            time: '5.6.72',
            duration: 3,
            max_people: 10,
            min_people: 5,
            user_founder: "user_foun2der"),
        Activity(
            idA: 2,
            title: 'naslov2',
            type: 'ti2p',
            description: 'opis2',
            num_of_people: 4,
            meeting_point: 'pic2ka materina',
            time: '5.6.72',
            duration: 3,
            max_people: 10,
            min_people: 5,
            user_founder: "user_foun2der"),
        Activity(
            idA: 2,
            title: 'naslov2',
            type: 'ti2p',
            description: 'opis2',
            num_of_people: 4,
            meeting_point: 'pic2ka materina',
            time: '5.6.72',
            duration: 3,
            max_people: 10,
            min_people: 5,
            user_founder: "user_foun2der"),
        Activity(
            idA: 2,
            title: 'naslov2',
            type: 'ti2p',
            description: 'opis2',
            num_of_people: 4,
            meeting_point: 'pic2ka materina',
            time: '5.6.72',
            duration: 3,
            max_people: 10,
            min_people: 5,
            user_founder: "user_foun2der"),
        Activity(
            idA: 2,
            title: 'naslov2',
            type: 'ti2p',
            description: 'opis2',
            num_of_people: 4,
            meeting_point: 'pic2ka materina',
            time: '5.6.72',
            duration: 3,
            max_people: 10,
            min_people: 5,
            user_founder: "user_foun2der"),
        Activity(
            idA: 2,
            title: 'naslov2',
            type: 'ti2p',
            description: 'opis2',
            num_of_people: 4,
            meeting_point: 'pic2ka materina',
            time: '5.6.72',
            duration: 3,
            max_people: 10,
            min_people: 5,
            user_founder: "user_foun2der"),
      ],
    );
  }
}
