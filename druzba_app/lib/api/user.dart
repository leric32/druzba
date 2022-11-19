import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/views/login_view.dart';
import 'package:test/views/home_view.dart';
import 'url.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class UserAPI {
  static Future<bool> checkLogin(String username, String pass) {
    return Future.delayed(
      const Duration(seconds: 1),
      () => true,
    );
  }

  static Future<int> login(String username, String pass) async {
    final response = await http.post(Uri.parse(API.url + 'login/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
            <String, String>{'password': pass, 'username': username}));
    print(response.body);

    final body = json.decode(response.body);

    return body['idu'];
  }

  static Future<bool> join(int idA) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int idU = sharedPreferences.getInt('idU') ?? 0;
    final response = await http.post(Uri.parse(API.url + 'join_activity/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, int>{'ida': idA, 'idu': idU}));
    print(response.body);

    final body = json.decode(response.body);
    return true;
  }

  static Future<bool> register(String username, String pass, String last_name,
      String pass2, String email, String first_name) async {
    if (pass != pass2) {
      return false;
    }
    final response = await http.post(Uri.parse(API.url + 'registration/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'password': pass,
          'username': username,
          'first_name': first_name,
          'last_name': last_name,
          'email': email
        }));

    final body = json.decode(response.body);
    print(body);

    if (body['idu'] == '') {
      return false;
    } else {
      return true;
    }
  }
}
