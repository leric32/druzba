import 'package:flutter/material.dart';
import '../views/home_view.dart';

class SearchWidget extends StatefulWidget {
  String text = '';
  HomeViewState hvs;

  SearchWidget(this.hvs);

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
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: width * 0.6,
      height: 42,
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        border: Border.all(color: Colors.black26),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
      child: TextField(
        onSubmitted: (value) =>
            {widget.hvs.searchActivity(widget._controller.text)},
        controller: widget._controller,
        decoration: InputDecoration(
          icon: Icon(Icons.search, color: Colors.red),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
