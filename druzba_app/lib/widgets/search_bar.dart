import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  String text = '';
  final TextEditingController _controller = TextEditingController();

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  void dispose() {
    print('test');
    widget._controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        border: Border.all(color: Colors.black26),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextField(
        onSubmitted: (value) => {print('test')},
        controller: widget._controller,
        decoration: InputDecoration(
          icon: Icon(Icons.search, color: Colors.red),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
