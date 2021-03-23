import 'package:flutter/material.dart';
import 'package:reader_project/core/tools/screen.dart';
import 'package:reader_project/ui/model/book_model.dart';
import 'package:reader_project/ui/pages/bookshelf/book_detail.dart';

class BookItem extends StatelessWidget {
  final BookModel model;
  final double width;
  const BookItem({Key key, this.model,this.width = 0}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, BookDetailPage.routerName,arguments: model.id);
      },

      child: Container(
        // color:Colors.orange,
        width: this.width,
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DecoratedBox(
              child: Image.network(
                model.imgUrl,
              ),
              decoration: BoxDecoration(boxShadow: [BoxShadow(color: Color(0x22000000), blurRadius: 5)]),
            ),
            SizedBox(height: 5,),
            Text(model.name, style: TextStyle(fontSize: 14), maxLines: 1, overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }
}
