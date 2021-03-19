import 'package:flutter/material.dart';
import 'package:reader_project/core/services/request.dart';
import 'package:reader_project/core/tools/screen.dart';
import 'package:reader_project/ui/model/book_model.dart';


class BookDetailPage extends StatefulWidget {
  static const String routerName = "book_detail";
  final String bookId;
  BookDetailPage({this.bookId});

  @override
  _BookDetailPageState createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
  BookModel model;
  double navAlpha = 1.0;
  List<BookModel> recommendBooks = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      print(this.widget.bookId);
      var bookId = this.widget.bookId;
      var novelResponse = await Request.post(action: "novel_detail", params: {"id":bookId});
      setState(() {
        model = BookModel.fromJson(novelResponse);
        print(model.name);
      });
    }catch(e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children:[
            Column(
              children: [
                Expanded(
                    child: ListView()
                ),
              ],
            ),
            buildNavgationBar(),
          ]
      ),

    );
  }


  Widget buildNavgationBar(){
    return Opacity(
      opacity: navAlpha,
      child: Container(
        height: Screen.navigationBarHeight,
        child: AppBar(
          title: Text(model != null ? model.name:"详情"),
        ),
      ),
    );
  }
}
