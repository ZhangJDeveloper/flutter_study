import 'package:flutter/material.dart';
import 'package:reader_project/core/tools/screen.dart';
import 'package:reader_project/ui/model/book_model.dart';
import 'package:reader_project/ui/pages/bookshelf/book_item.dart';

class RecommendView extends StatelessWidget {
  final List<BookModel> books;

  RecommendView(this.books);

  Widget buildItems(){
    var width = (Screen.width - 15 * 2 - 15 * 3) / 4;
    var children = books.map((model) => BookItem(model: model,width: width,)).toList();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Wrap(spacing: 15, runSpacing: 20, children: children,),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Row(
              children: [
                Image.asset("assets/images/2.0x/home_tip.png",width: 2,),
                SizedBox(width: 13,),
                Text("看过本书的人还在看", style: TextStyle(fontSize: 14),)
              ],
            ),
          ),
          buildItems(),
        ],
      ),
    );
  }
}
