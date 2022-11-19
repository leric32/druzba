import 'package:flutter/material.dart';

class GradientAppBar extends StatefulWidget implements PreferredSizeWidget {
  static const double barHeight = 50.0;

  @override
  GradientAppBArState createState() => GradientAppBArState();

  @override
  Size get preferredSize {
    return const Size.fromHeight(barHeight);
  }
}

class GradientAppBArState extends State<GradientAppBar> {
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
    final double statusbarHeight = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.only(top: statusbarHeight),
      height: statusbarHeight + GradientAppBar.barHeight,
      child: _backButton(),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Color(0xfffbb448), Color(0xfff7892b)]),
      ),
    );
  }
}
