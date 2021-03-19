import 'package:flutter/material.dart';
import 'package:reader_project/ui/pages/bookmark/book_mark.dart';
import 'package:reader_project/ui/pages/bookshelf/book_shelf.dart';
import 'package:reader_project/ui/pages/mine/mine.dart';




final List<Widget> pages = [
  ZJBookShelfPage(),
  ZJBookMarkPage(),
  ZJMinePage(),
];

final List<BottomNavigationBarItem> items = [
  ZJTabBarItem("tab_bookshelf","书架"),
  ZJTabBarItem("tab_bookstore","书城"),
  ZJTabBarItem("tab_mine","我的"),
];


class ZJTabBarItem extends BottomNavigationBarItem {

  ZJTabBarItem(String iconName, String title)
      : super(
      label: title,
      icon:Image.asset("assets/tabbar/$iconName.png",width: 24,),
      activeIcon:Image.asset("assets/tabbar/${iconName}_selected.png",width: 24,)
  );
}