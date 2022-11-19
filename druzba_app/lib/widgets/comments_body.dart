import 'package:flutter/material.dart';

import '../widgets/comment_item.dart';
import '../models/comment.dart';

class CommentBody extends StatefulWidget {
  List<Comment> comments = [];

  CommentBody({super.key, required this.comments});

  @override
  CommentBodyState createState() => CommentBodyState();
}

class CommentBodyState extends State<CommentBody> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.comments.length,
        itemBuilder: (BuildContext context, int index) {
          return CommentItem(comment: widget.comments[index]);
        });
  }
}
