import 'package:flutter/material.dart';

class GradientAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  static const double barHeight = 50.0;

  GradientAppBar(this.title);

  @override
  GradientAppBArState createState() => GradientAppBArState();

  @override
  Size get preferredSize {
    return const Size.fromHeight(barHeight);
  }
}

class GradientAppBArState extends State<GradientAppBar> {
  @override
  Widget build(BuildContext context) {
    final double statusbarHeight = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.only(top: statusbarHeight),
      height: statusbarHeight + GradientAppBar.barHeight,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Color(0xfffbb448), Color(0xfff7892b)]),
      ),
      child: Center(
        child: Text(
          widget.title,
          style: TextStyle(
              fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
