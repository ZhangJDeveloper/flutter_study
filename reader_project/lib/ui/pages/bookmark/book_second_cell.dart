import 'package:flutter/material.dart';
import 'package:reader_project/ui/model/home_model.dart';
import 'package:reader_project/ui/pages/bookmark/book_cover_view.dart';
import 'package:reader_project/ui/pages/bookmark/book_first_cell.dart';
import 'package:reader_project/ui/pages/bookmark/book_grid_view.dart';
import 'package:reader_project/ui/pages/bookmark/home_section.dart';

class BookSecondCell extends StatelessWidget {
  final HomeModel model;

  BookSecondCell(this.model);

  @override
  Widget build(BuildContext context) {
    var books = model.books;
    if(books.length < 5) {
      return Container();
    }
    var topBooks = books.sublist(0,4);
    List<Widget> children = [];
    // topBooks.map((book) {  //还回一个新的容器
    //   children.add(BookCoverView(book));
    // });

    topBooks.forEach((element) {
      children.add(BookCoverView(element));
    });

    var bottomBooks = books.sublist(4);
    bottomBooks.forEach((element) {
      children.add(BookGridView(element));
    });

    return Container(
      child: Column(
        children: [
          HomeSectionView(model.name),
          Container(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Wrap(children: children,spacing: 15, runSpacing: 20),
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
