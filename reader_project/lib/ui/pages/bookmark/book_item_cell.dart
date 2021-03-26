import 'package:flutter/material.dart';
import 'package:reader_project/ui/model/book_model.dart';
import 'package:reader_project/ui/pages/bookshelf/book_detail.dart';

class BookItemCell extends StatelessWidget {
  final BookModel model;

  BookItemCell(this.model);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, BookDetailPage.routerName, arguments: model.id);
      },
      child: Container(
        padding: EdgeInsets.all(15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(model.imgUrl, width: 70, height: 93,),
            SizedBox(width: 15,),
            Expanded(child: buildRight()),
          ],
        ),
      ),
    );
  }

  Widget buildRight(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(model.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
        SizedBox(height: 5,),
        Text(model.introduction, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 14, color: Colors.grey),),
        SizedBox(height: 5,),
        Row(
          children: [
            Text(model.author, style: TextStyle(fontSize: 14, color: Colors.blueGrey),),
            Expanded(child: Container()),
            buildTag(model.status, model.statusColor()),
            SizedBox(width: 5,),
            buildTag(model.type, Colors.grey),
          ],
        ),
      ],
    );
  }

  Widget buildTag(String title, Color color){
    return Container(
      padding: EdgeInsets.fromLTRB(5, 2, 5, 3),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromARGB(99, color.red, color.green, color.blue), width: 0.5),
        borderRadius: BorderRadius.circular(3)
      ),
      child: Text(title, style: TextStyle(fontSize: 11, color: color),),
    );
  }
}
