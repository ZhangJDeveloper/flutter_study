import 'package:flutter/material.dart';
import 'package:reader_project/core/tools/screen.dart';
import 'package:reader_project/core/tools/tools.dart';

// 小说简介


class BookIntroduction extends StatelessWidget {
  final bool isUnfold;
  final String summary;
  final VoidCallback onPressed;
  BookIntroduction(this.summary, this.isUnfold, this.onPressed);

  @override
  Widget build(BuildContext context) {
    var maxWidth = Screen.width - 30;
    var width = calculateTextSize(summary,14.0,context,maxWidth).width;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
        child: Column(
          crossAxisAlignment: width < maxWidth? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: [
            Text(summary,maxLines: isUnfold ? null: 3,style: TextStyle(fontSize: 14.0),),
            width < maxWidth ? Container():Image.asset(isUnfold ? 'assets/images/2.0x/detail_up.png' : 'assets/images/2.0x/detail_down.png',width: 15,),

          ],
        ),
      ),
    );
  }
}
