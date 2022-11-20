import '../models/activity.dart';
import 'url.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/views/login_view.dart';
import 'package:test/views/home_view.dart';
import 'url.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class DataAPI {
  static Future<List<Activity>> getActivityList() async {
    final response =
        await http.get(Uri.parse(API.url + ''), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    });
    print(response.body);

    final body = json.decode(response.body);

    final activies = body['act'];

    final Iterable<Activity> finalAct = [];

    for (var i = 0; i < activies.length; i++) {
      (finalAct as List<Activity>).add(Activity(
          idA: activies[i]['idA'],
          title: activies[i]['title'],
          type: activies[i]['type'],
          description: activies[i]['description'],
          num_of_people: activies[i]['num_of_people'],
          meeting_point: activies[i]['meeting_point'],
          time: activies[i]['time'],
          duration: activies[i]['duration'],
          max_people: activies[i]['max_people'],
          min_people: activies[i]['min_people'],
          user_founder: activies[i]['user_founder']));
    }

    return finalAct as List<Activity>;
  }

  static Future<List<Activity>> getSearchedList(String word) async {
    final response = await http.post(Uri.parse(API.url + 'search/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, String>{'word': word}));
    print(response.body);

    final body = json.decode(response.body);

    final activies = body['act'];

    final Iterable<Activity> finalAct = [];

    for (var i = 0; i < activies.length; i++) {
      (finalAct as List<Activity>).add(Activity(
          idA: activies[i]['idA'],
          title: activies[i]['title'],
          type: activies[i]['type'],
          description: activies[i]['description'],
          num_of_people: activies[i]['num_of_people'],
          meeting_point: activies[i]['meeting_point'],
          time: activies[i]['time'],
          duration: activies[i]['duration'],
          max_people: activies[i]['max_people'],
          min_people: activies[i]['min_people'],
          user_founder: activies[i]['user_founder']));
    }

    return finalAct as List<Activity>;
  }

  static Future<bool> createActivity(
      String title,
      String meeting_point,
      String description,
      String duration,
      String max_people,
      String min_people,
      String type,
      String start_time) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int idU = sharedPreferences.getInt('idU') ?? 0;

    final response = await http.post(Uri.parse(API.url + 'create_activity/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'title': title,
          'meeting_point': meeting_point,
          'desc': description,
          'duration': duration,
          'max_people': max_people,
          'min_people': min_people,
          'typeName': type,
          'start_time': start_time,
          'idu': idU.toString()
        }));

    final body = json.decode(response.body);
    print(body);

    if (body['ida'] == '') {
      return false;
    } else {
      return true;
    }
  }
}
