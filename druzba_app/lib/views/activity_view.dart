// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../models/activity.dart';
import '../widgets/gradient_app_bar_small.dart';
import '../icons/custom_home_icons.dart';
import 'comments_view.dart';

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

  int join_num = 0;

  @override
  void initState() {
    _getNumParticipants();
    super.initState();
  }

  _getNumParticipants() async {
    join_num = 0;
    //join_num = await UserAPI.nesto() OVDE DODATI API FUNKCIJU
    setState(() {});
  }

  Widget _commentButton() {
    return TextButton(
        onPressed: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CommentView(
                            activity: widget.activity,
                          )))
            },
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 15),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.shade200,
                    offset: Offset(2, 4),
                    blurRadius: 5,
                    spreadRadius: 2)
              ],
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xfffbb448), Color(0xfff7892b)])),
          child: Text(
            'Komentari',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ));
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
          Row(children: [
            SizedBox(width: width * 0.00),
            Icon(CustomHome.adult, color: Color(0xffe46b10), size: icon_size),
            SizedBox(width: width * 0.02),
            Text(
              widget.activity.user_founder,
              style: TextStyle(fontSize: text_icon_size),
            ),
          ]),
          SizedBox(height: height * 0.02),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              widget.activity.title,
              style: TextStyle(fontSize: 45, fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(height: height * 0.03),
          _commentButton(),
          SizedBox(height: height * 0.03),
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
                Icon(CustomHome.hourglass,
                    color: Color(0xffe46b10), size: icon_size),
                SizedBox(width: width * 0.02),
                Text(
                  widget.activity.duration.toString() + " h",
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
                  widget.activity.type,
                  style: TextStyle(fontSize: text_icon_size),
                ),
              ]),
            ]),
          ),
        ]),
      ),
      floatingActionButton: SizedBox(
          width: 80,
          height: 80,
          child: FloatingActionButton(
            backgroundColor: Color(0xfff7892b),
            onPressed: () => {print("implementiraj da se prijavi")},
            tooltip: 'Prijava',
            child: const Icon(CustomHome.user_add,
                color: Color.fromARGB(255, 2, 2, 2)),
          )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
