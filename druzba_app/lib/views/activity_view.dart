// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../models/activity.dart';
import '../widgets/gradient_app_bar_small.dart';
import '../icons/custom_home_icons.dart';

class ActivityView extends StatefulWidget {
  Activity activity;

  ActivityView({
    Key? key,
    required this.activity,
  }) : super(key: key);

  @override
  ActivityViewState createState() => ActivityViewState();
}

class ActivityViewState extends State<ActivityView> {
  final double icon_size = 40;
  final double text_icon_size = 20;

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: GradientAppBar(),
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 20, 30, 10),
        child: Column(children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              widget.activity.title,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(height: height * 0.02),
          Text(
            widget.activity.description,
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          Align(
            alignment: Alignment.center,
            child: Column(children: [
              Row(children: [
                SizedBox(width: width * 0.00),
                Icon(CustomHome.location,
                    color: Color(0xffe46b10), size: icon_size),
                SizedBox(width: width * 0.02),
                Text(
                  widget.activity.meeting_point,
                  style: TextStyle(fontSize: text_icon_size),
                ),
              ]),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Row(children: [
                SizedBox(width: width * 0.00),
                Icon(CustomHome.access_time,
                    color: Color(0xffe46b10), size: icon_size),
                SizedBox(width: width * 0.02),
                Text(
                  widget.activity.time,
                  style: TextStyle(fontSize: text_icon_size),
                ),
              ]),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Row(children: [
                SizedBox(width: width * 0.00),
                Icon(CustomHome.people,
                    color: Color(0xffe46b10), size: icon_size),
                SizedBox(width: width * 0.02),
                Text(
                  '' +
                      widget.activity.min_people.toString() +
                      ' - ' +
                      widget.activity.max_people.toString(),
                  style: TextStyle(fontSize: text_icon_size),
                ),
              ]),
            ]),
          )
        ]),
      ),
      floatingActionButton: SizedBox(
          width: 80,
          height: 80,
          child: FloatingActionButton(
            backgroundColor: Color(0xfff7892b),
            onPressed: () => {Navigator.pop(context)},
            tooltip: 'Increment',
            child: const Icon(CustomHome.user_add,
                color: Color.fromARGB(255, 2, 2, 2)),
          )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
