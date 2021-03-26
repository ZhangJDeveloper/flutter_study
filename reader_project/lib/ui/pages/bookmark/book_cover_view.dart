import 'package:flutter/material.dart';
import 'package:reader_project/core/tools/screen.dart';
import 'package:reader_project/ui/model/book_model.dart';
import 'package:reader_project/ui/pages/bookshelf/book_detail.dart';

class BookCoverView extends StatelessWidget {
  final BookModel book;

  BookCoverView(this.book);

  @override
  Widget build(BuildContext context) {
    var width = (Screen.width - 15 * 2 - 15 * 3) / 4;
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, BookDetailPage.routerName, arguments: book.id);
      },
      child: Container(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(book.imgUrl,width: 80,),
            SizedBox(height: 3,),
            Text(book.name,style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),overflow:TextOverflow.ellipsis,maxLines: 1,),
            SizedBox(height: 3,),
            Text(book.author, style: TextStyle(fontSize: 12.0, color: Colors.grey),maxLines: 1,)
          ],
        ),
      ),
    );
  }
}
