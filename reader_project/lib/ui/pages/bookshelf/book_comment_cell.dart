import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:reader_project/ui/model/comment_model.dart';

class BookCommentCell extends StatelessWidget {
  final CommentModel comment;

  BookCommentCell(this.comment);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildContent(),
        Divider(height: 1, indent: 15,)
      ],
    );
  }

  Widget buildContent(){
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius:13,
                backgroundImage: CachedNetworkImageProvider(comment.avatar,maxWidth: 26),
              ),
              SizedBox(width: 10,),
              Text(comment.nickName, style: TextStyle(fontSize: 14, color: Color(0xFF888888)),)
            ],
          ),
          Container(
            padding: EdgeInsets.fromLTRB(35, 10, 10, 0),
            child: Text(comment.content, style: TextStyle(fontSize: 16.0),),
          )
        ],
      ),
    );
  }
}
