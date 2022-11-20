// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../views/comments_view.dart';
import '../models/comment.dart';
import '../icons/custom_home_icons.dart';

class CommentItem extends StatelessWidget {
  Comment comment;

  CommentItem({
    Key? key,
    required this.comment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Color(0xfffbb448),
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
          child: Column(children: [
            Row(children: [
              SizedBox(width: width * 0.00),
              Icon(CustomHome.adult, color: Color(0xffe46b10), size: 30),
              SizedBox(width: width * 0.02),
              Text(
                comment.autor,
                style: TextStyle(fontSize: 20),
              ),
            ]),
            Text(
              comment.desc,
              style: TextStyle(fontSize: 15),
            ),
          ]),
        ));
  }
}
