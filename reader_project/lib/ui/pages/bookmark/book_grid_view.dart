import 'package:flutter/material.dart';
import 'package:reader_project/core/tools/screen.dart';
import 'package:reader_project/ui/model/book_model.dart';
import 'package:reader_project/ui/pages/bookshelf/book_detail.dart';

class BookGridView extends StatelessWidget {
  final BookModel book;

  BookGridView(this.book);

  @override
  Widget build(BuildContext context) {
    var width = (Screen.width - 15*3)/2.0;
    return GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, BookDetailPage.routerName, arguments: book.id);
        },
        child: Container(
          width: width,
          child: Row(
            children: [
              Image.network(book.imgUrl, width: 50, height: 60,),
              SizedBox(width: 10,),
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(book.name, maxLines: 2, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                  Text(book.recommendCountStr(),style: TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              )),
            ],
          ),
        )
    );
  }
}
