import 'package:flutter/material.dart';
import 'package:reader_project/ui/model/home_model.dart';
import 'package:reader_project/ui/pages/bookmark/book_grid_view.dart';
import 'package:reader_project/ui/pages/bookmark/book_item_cell.dart';
import 'package:reader_project/ui/pages/bookmark/home_section.dart';

class BookThirdCell extends StatelessWidget {
  final HomeModel model;

  BookThirdCell(this.model);


  @override
  Widget build(BuildContext context) {
    var books = model.books;
    if(books.length < 3) {
      return Container();
    }
    List<Widget> children = [];
    var subList = books.sublist(1);
    subList.map((e) => children.add(BookGridView(e))).toList();
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          HomeSectionView(model.name),
          BookItemCell(books[0]),
          Container(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Wrap(spacing: 15, runSpacing: 15, children: children),
          ),
          Container(
            height: 10,
            color: Color(0xfff5f5f5),
          )
        ],
      ),
    );
  }
}
