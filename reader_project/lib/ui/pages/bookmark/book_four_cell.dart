import 'package:flutter/material.dart';
import 'package:reader_project/ui/model/home_model.dart';
import 'package:reader_project/ui/pages/bookmark/book_item_cell.dart';
import 'package:reader_project/ui/pages/bookmark/home_section.dart';

class BookFourCell extends StatelessWidget {
  final HomeModel model;

  BookFourCell(this.model);

  @override
  Widget build(BuildContext context) {
    var books = model.books;
    if(books.length <= 0) {
      return Container();
    }
    List<Widget> children = [
      HomeSectionView(model.name),
    ];
    books.forEach((element) {
      children.add(BookItemCell(element));
      children.add(Divider(height: 1,));
    });
    children.add(Container(height: 10, color: Color(0xfff5f5f5)));
    return Container(
      color: Colors.white,
      child: Column(
        children: children,
      ),
    );
  }
}
