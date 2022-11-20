import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/widgets/comments_body.dart';
import '../api/user.dart';
import '../widgets/activity_item.dart';
import '../models/activity.dart';
import '../widgets/gradient_app_bar_small.dart';
import '../widgets/home_body.dart';
import '../models/comment.dart';

class CommentView extends StatefulWidget {
  const CommentView({super.key, required this.activity});

  final Activity activity;

  @override
  State<CommentView> createState() => _CommentViewState();
}

class _CommentViewState extends State<CommentView> {
  List<Comment> comments = [];

  @override
  void initState() {
    _getComments();
    super.initState();
  }

  _getComments() async {
    //comments = [];
    //comments = await UserAPI.getActivityList(); Ovo implementirati
    comments = [
      Comment(desc: 'Jako dobra ideja!', autor: 'Marko'),
      Comment(desc: 'Obavezno dolazim', autor: 'Nikola'),
      Comment(desc: 'Ja mogu da vozim', autor: 'cmiki'),
      Comment(desc: 'Ajde ljudi idemo svi', autor: 'tasha'),
      Comment(
          desc: 'Kako dobra ideja, nisam znao da ovo postoji', autor: 'aki'),
      Comment(desc: 'Vauuuu', autor: 'Marko'),
      Comment(desc: 'Vidimo se ljudi', autor: 'tash')
    ];
    setState(() {});
  }

  Icon searchIcon = const Icon(Icons.search);
  Widget searchBarText = const Text('Nesto');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(),
      body: CommentBody(comments: comments),
      floatingActionButton: SizedBox(
          width: 80,
          height: 80,
          child: FloatingActionButton(
            backgroundColor: Color(0xfff7892b),
            onPressed: () => {print("implementiraj da se komentarise")},
            tooltip: 'Comment',
            child: const Icon(Icons.add, color: Color.fromARGB(255, 2, 2, 2)),
          )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
