// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../models/activity.dart';
import '../icons/custom_home_icons.dart';

class ActivityItem extends StatelessWidget {
  Activity activity;

  ActivityItem({
    Key? key,
    required this.activity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Color(0xfffbb448),
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Column(children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                activity.title,
                style: TextStyle(fontSize: 30),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Row(children: [
              SizedBox(width: width * 0.05),
              Icon(CustomHome.location, color: Color(0xffe46b10)),
              SizedBox(width: width * 0.02),
              Text(activity.meeting_point),
            ]),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Row(children: [
              SizedBox(width: width * 0.05),
              Icon(CustomHome.access_time, color: Color(0xffe46b10)),
              SizedBox(width: width * 0.02),
              Text(activity.time),
            ]),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Row(children: [
              SizedBox(width: width * 0.05),
              Icon(
                CustomHome.people,
                color: Color(0xffe46b10),
              ),
              SizedBox(width: width * 0.02),
              Text('' +
                  activity.min_people.toString() +
                  ' - ' +
                  activity.max_people.toString()),
            ]),
          ]),
        ));
  }
}
