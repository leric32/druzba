import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:test/views/home_view.dart';
import 'package:test/views/login_view.dart';
import 'search_bar.dart';
import '../icons/custom_home_icons.dart';
import 'package:test/api/user.dart';
import '../views/map_view.dart';

class GradientAppBar extends StatefulWidget implements PreferredSizeWidget {
  final HomeViewState hvs;
  static const double barHeight = 80.0;

  GradientAppBar(this.hvs);

  @override
  GradientAppBArState createState() => GradientAppBArState();

  @override
  Size get preferredSize {
    return const Size.fromHeight(barHeight);
  }
}

class GradientAppBArState extends State<GradientAppBar> {
  Future<void> _checkLogout() async {
    await UserAPI.logout();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginView()));
  }

  @override
  Widget build(BuildContext context) {
    final double statusbarHeight = MediaQuery.of(context).padding.top;

    return Container(
        padding: EdgeInsets.only(top: statusbarHeight, left: 10, right: 10),
        height: statusbarHeight + GradientAppBar.barHeight,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xfffbb448), Color(0xfff7892b)]),
        ),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MapView(activities: widget.hvs.activities)))
                      },
                  icon: Icon(
                    CustomHome.globe,
                    color: Colors.black,
                  )),
              SearchWidget(widget.hvs),
              IconButton(
                  onPressed: () => {_checkLogout()},
                  icon: Icon(
                    CustomHome.logout,
                    color: Colors.black,
                  ))
            ],
          )
        ]));
  }
}
