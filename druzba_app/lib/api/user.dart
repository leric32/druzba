import 'url.dart';
import 'package:http/http.dart' as http;
import '../models/activity.dart';

class UserAPI {
  static Future<bool> checkLogin(String username, String pass) {
    return Future.delayed(
      const Duration(seconds: 1),
      () => false,
    );
  }

  static Future<bool> login(String username, String pass) {
    return Future.delayed(
      const Duration(seconds: 1),
      () => true,
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