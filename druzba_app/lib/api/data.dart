import '../models/activity.dart';
import 'url.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
}
