import 'package:flutter/material.dart';
import 'package:test/icons/custom_home_icons.dart';

class SubMenuWidget extends StatefulWidget {
  String text = '';
  final TextEditingController _controller = TextEditingController();

  @override
  _SubMenuWidgetState createState() => _SubMenuWidgetState();
}

class _SubMenuWidgetState extends State<SubMenuWidget> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
        width: width,
        height: 42,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black26),
        ),
        child: Align(
          alignment: Alignment.center,
          child: IconButton(
            onPressed: () => {},
            icon: Icon(CustomHome.globe),
          ),
        ));
  }
}
