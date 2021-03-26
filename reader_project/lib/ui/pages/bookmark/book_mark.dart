import 'package:flutter/material.dart';

import 'book_list.dart';

class ZJBookMarkPage extends StatefulWidget {
  @override
  _ZJBookMarkPageState createState() => _ZJBookMarkPageState();
}

class _ZJBookMarkPageState extends State<ZJBookMarkPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
          backgroundColor: Color(0xFFFFFFFF),
          elevation: 0,
          title: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: TabBar(
              labelColor: Color(0xFF333333),
              labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              unselectedLabelColor: Color(0xFF888888),
              indicatorColor: Color(0xFF51DEC6),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 3,
              indicatorPadding: EdgeInsets.fromLTRB(8, 0, 8, 5),
              tabs: [
                Tab(text: '精选'),
                Tab(text: '女生'),
                Tab(text: '男生'),
                Tab(text: '漫画'),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            BookListView(BookListType.excellent),
            BookListView(BookListType.female),
            BookListView(BookListType.male),
            BookListView(BookListType.cartoon),
          ],
        ),
      ),
    );
  }
}
