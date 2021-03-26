import 'package:flutter/material.dart';
import 'package:reader_project/ui/model/home_model.dart';
import 'package:reader_project/ui/pages/bookmark/book_cover_view.dart';
import 'package:reader_project/ui/pages/bookmark/home_section.dart';

class BookFirstCell extends StatelessWidget {

  final HomeModel model;


  BookFirstCell(this.model);

  @override
  Widget build(BuildContext context) {
    var books = model.books;
    if(books.length < 8) {
      return Container();
    }
    var children = books.map((book) => BookCoverView(book)).toList();
    return Container(
      child: Column(
        children: [
          HomeSectionView(model.name),
          Container(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Wrap(spacing: 15, runSpacing: 20, children: children,),
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
