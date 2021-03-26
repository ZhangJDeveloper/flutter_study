import 'package:flutter/material.dart';
import 'package:reader_project/core/services/request.dart';
import 'package:reader_project/core/tools/screen.dart';
import 'package:reader_project/ui/model/book_model.dart';
import 'package:reader_project/ui/model/comment_model.dart';
import 'package:reader_project/ui/pages/bookshelf/book_comment_cell.dart';
import 'package:reader_project/ui/pages/bookshelf/book_detail_cell.dart';
import 'package:reader_project/ui/pages/bookshelf/recommend_view.dart';

import 'book_Introduction.dart';
import 'book_detail_header.dart';
import 'book_detail_toobar.dart';


class BookDetailPage extends StatefulWidget {
  static const String routerName = "book_detail";
  final String bookId;
  BookDetailPage({this.bookId});

  @override
  _BookDetailPageState createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
  BookModel model;
  double navAlpha = 0.0;
  List<BookModel> recommendBooks = [];
  List<CommentModel> comments = [];
  ScrollController _scrollController;
  bool isSummaryUnfold = false;

  @override
  void initState() {
    super.initState();
    fetchData();

    _scrollController = ScrollController();
    _scrollController.addListener(() {
      var offset = _scrollController.offset;
      if(offset <= 0) {
        if(navAlpha != 0.0){
          setState(() {
            navAlpha = 0.0;
          });
        }
      }else if(offset < 50 ){
        setState(() {
          navAlpha = 1 - (50 - offset) / 50;
        });
      }else if (navAlpha != 1) {
        setState(() {
          navAlpha = 1;
        });
      }

    });

  }

  @override
  void dispose(){
    super.dispose();
    _scrollController.dispose();
  }

  Future<void> fetchData() async {
    try {
      print(this.widget.bookId);
      var bookId = this.widget.bookId;

      var commentResponse = await Request.post(action: 'novel_comment', params: {'id': bookId});
      List<CommentModel> comments = [];
      commentResponse.forEach((data){
        comments.add(CommentModel.fromJson(data));
      });

      var recommendResponse = await Request.post(action: 'novel_recommend', params: {'id': bookId});
      List<BookModel> recommendBooks = [];
      recommendResponse.forEach((data){
        recommendBooks.add(BookModel.fromJson(data));
      });

      var novelResponse = await Request.post(action: "novel_detail", params: {"id":bookId});
      setState(() {
        model = BookModel.fromJson(novelResponse);
        this.comments = comments;
        this.recommendBooks = recommendBooks;
      });
    }catch(e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    if (this.model == null) {
      return Scaffold(appBar: AppBar(elevation: 0));
    }

    return Scaffold(
      body: Stack(
          children:[
            Column(
              children: [
                Expanded(
                    child: ListView(
                      controller: _scrollController,
                      padding: EdgeInsets.only(top: 0),
                      children: [
                        BookDetailHeader(model),
                        BookIntroduction(model.introduction,isSummaryUnfold,changedSummaryMaxLines),
                        BookDetailCell(
                          iconName: "detail_latest.png",
                          title: "最新",
                          subtitle: model.lastChapter.title,
                          attachedWidget: Text(model.status, style: TextStyle(fontSize: 14, color: model.statusColor()),),
                        ),
                        BookDetailCell(
                          iconName: "detail_chapter.png",
                          title: "目录",
                          subtitle: "共${model.chapterCount}章",
                        ),
                        buildTags(),
                        SizedBox(height: 10),
                        buildComment(),
                        SizedBox(height: 10,),
                        RecommendView(recommendBooks),
                      ],
                    ),
                ),
                BookDetailToolbar(model),
              ],
            ),
            buildNavgationBar(),
          ]
      ),

    );
  }

  changedSummaryMaxLines(){
    setState(() {
      isSummaryUnfold = !isSummaryUnfold;
    });
  }

  Widget buildComment(){
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Row(
              children:[
                Image.asset("assets/images/2.0x/home_tip.png",width: 3,),
                SizedBox(width: 13,),
                Text("书友评价", style: TextStyle(fontSize: 16),),
                Expanded(child: Container()),
                Image.asset("assets/images/2.0x/detail_write_comment.png",width: 10,),
                Text("  写书评",style: TextStyle(fontSize: 14, color: Color(0xFF23B38E)),),
                SizedBox(width: 15,),
              ],
            ),
          ),
          Divider(height: 1,),
          Column(
            children: comments.map((comment) => BookCommentCell(comment)).toList(),
          ),
        ],
      ),
    );
  }

  Widget buildTags(){
    var colors = [Color(0xFFF9A19F),Color(0xFF59DDB9), Color(0xFF7EB3E7)];
    var i = 0;
    var tagWidgets = model.tags.map((e) {
      var color = colors[i % 3];
      var tagWidget = Container(
        padding: EdgeInsets.fromLTRB(6, 3, 6, 3),
        decoration: BoxDecoration(
          border: Border.all(color: Color.fromARGB(99, color.red, color.green, color.blue),width: 0.5),
          borderRadius: BorderRadius.circular(3),
        ),
        child: Text(e, style: TextStyle(fontSize: 14, color: colors[i%3]),),
      );
      i++;
      return tagWidget;
    }).toList();

    return Container(
      padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
      color: Colors.white,
      // height: 50,
      child: Wrap(
        direction:Axis.horizontal,
        children: tagWidgets,
        spacing: 10,
        runSpacing: 10,
      ),
    );
  }

  Widget buildNavgationBar(){

    return Stack(
      children: [
        Container(
          width: 44,
          height: Screen.navigationBarHeight,
          padding: EdgeInsets.fromLTRB(5, Screen.topSafeHeight, 0, 0),
          child: GestureDetector(onTap:()=>Navigator.pop(context) , child: Image.asset('assets/images/2.0x/pub_back_white.png',)),
        ),
        Opacity(
          opacity: navAlpha,
          child: Container(
          height: Screen.navigationBarHeight,
          child: AppBar(
            title: Text(model != null ? model.name:"详情"),
          ),
        ),
      )],
    );
  }
}
