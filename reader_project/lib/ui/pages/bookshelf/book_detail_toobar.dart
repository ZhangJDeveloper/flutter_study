import 'package:flutter/material.dart';
import 'package:reader_project/core/tools/screen.dart';
import 'package:reader_project/core/tools/styles.dart';
import 'package:reader_project/ui/model/book_model.dart';

class BookDetailToolbar extends StatelessWidget {
  final BookModel model;

  BookDetailToolbar(this.model);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50 + Screen.bottomSafeHeight,
      padding: EdgeInsets.only(bottom: Screen.bottomSafeHeight),
      decoration: BoxDecoration(color: Colors.white, boxShadow: Styles.borderShadow),
      child: Row(children:[
        Expanded(
            child: Center(
              child:Text('加书架', style: TextStyle(fontSize: 16, color: Color(0xFF23B38E)))
            )
        ),

        Expanded(
            child: GestureDetector(
              onTap: (){

              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(color: Color(0xFF23B38E), borderRadius: BorderRadius.circular(5)),
                child: Center(child: Text("开始阅读", style: TextStyle(fontSize: 16, color: Colors.white),)),
              ),
            ),
        ),
        Expanded(
            child: Center(
                child: Text("下载",style: TextStyle(fontSize: 16, color: Color(0xFF23B38E))),
            ),
        ),
      ],
      ),
    );
  }
}
