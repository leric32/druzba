import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../api/user.dart';
import '../api/data.dart';

import '../widgets/activity_item.dart';
import '../models/activity.dart';
import '../widgets/gradient_app_bar.dart';
import '../widgets/home_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  final String title = "Blah";

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Activity> activities = [];

  @override
  void initState() {
    _getActivities();
    super.initState();
  }

  _getActivities() async {
    activities = [];
    activities = await DataAPI.getActivityList();
    setState(() {});
  }

  Icon searchIcon = const Icon(Icons.search);
  Widget searchBarText = const Text('Nesto');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar('nesto'),
      body: HomeBody(activities: activities),
      floatingActionButton: SizedBox(
          width: 80,
          height: 80,
          child: FloatingActionButton(
            backgroundColor: Color(0xfff7892b),
            onPressed: () => {Navigator.pop(context)},
            tooltip: 'Increment',
            child: const Icon(Icons.add, color: Color.fromARGB(255, 2, 2, 2)),
          )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
