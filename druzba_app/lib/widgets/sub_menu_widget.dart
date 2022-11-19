import 'package:flutter/material.dart';

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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Expanded(child: Center(child: TextButton(onPressed: ()=>{print('implementiraj toggle')},))),
    VerticalDivider(width: 1.0),
    Expanded(child: Center(child: TextButton(...))),
  ],
      )
    );
  }
}
