import 'package:flutter/material.dart';
import 'package:reader_project/core/tools/screen.dart';
import 'package:reader_project/core/tools/styles.dart';
import 'package:reader_project/ui/model/book_model.dart';


class BookshelfHeader extends StatefulWidget {
  final BookModel book;

  BookshelfHeader({this.book});

  @override
  _BookshelfHeaderState createState() => _BookshelfHeaderState();

}

class _BookshelfHeaderState extends State<BookshelfHeader> {
  @override
  Widget build(BuildContext context) {
    var width = Screen.width;
    var bgHeight = width / 0.9;
    var height = Screen.topSafeHeight + 250;
    return Container(
      width: double.infinity,
      height: Screen.topSafeHeight + 250,
      child: Stack(
        children: [
          Positioned(
            top: height - bgHeight,
            child: Image.asset("assets/images/2.0x/bookshelf_bg.png",fit: BoxFit.cover,width: width,height: bgHeight,),

          ),
          Positioned(
              bottom: 0,
              child: Image.asset(
                  'assets/images/2.0x/bookshelf_cloud_0.png',
                  fit: BoxFit.cover,
                  width: width)
          ),
          buildContent(context),
        ],
      ),
    );
  }

  Widget buildContent(BuildContext context) {
    BookModel book = this.widget.book;
    
    return Container(
      width: Screen.width,
      padding: EdgeInsets.fromLTRB(15, 54 + Screen.topSafeHeight, 10, 0),
      color: Colors.transparent,
      child: GestureDetector(
        onTap: (){

        },
        child: Row(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(boxShadow: Styles.borderShadow,),
              child: Container(
                child: Image.network("${book.imgUrl}", width: 120, height: 160),
                decoration: BoxDecoration(border: Border.all(color: Color(0xFFF5F5F5))),
              ),
            ),
            SizedBox(width: 20,),
            Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40,),
                Text(book.name, style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Text("读至0.2%     继续阅读 ", style: TextStyle(fontSize: 14.0, color: Color(0xFFF5F5F5)),),
                    Image.asset("assets/images/2.0x/bookshelf_continue_read.png",width: 12,),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
