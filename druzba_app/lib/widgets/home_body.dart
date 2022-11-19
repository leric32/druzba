import 'package:flutter/material.dart';

import '../widgets/activity_item.dart';
import '../models/activity.dart';

class HomeBody extends StatefulWidget {
  List<Activity> activities = [];

  HomeBody({super.key, required this.activities});

  @override
  HomeBodyState createState() => HomeBodyState();
}

class HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.activities.length,
        itemBuilder: (BuildContext context, int index) {
          return ActivityItem(activity: widget.activities[index]);
        });
  }
}
