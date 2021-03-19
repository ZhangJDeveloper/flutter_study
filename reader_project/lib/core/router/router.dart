import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reader_project/ui/pages/bookshelf/book_detail.dart';
import 'package:reader_project/ui/pages/main/main_screen.dart';

class ZJRouter {
  static final String initialRoute = ZJMainScreen.routeName;

  static final Map<String, WidgetBuilder> routes = {
    ZJMainScreen.routeName:(ctx) => ZJMainScreen(),
  };

  // 自己扩转
  static final RouteFactory generateRoute = (settings) {
    if(settings.name == BookDetailPage.routerName) {
      return MaterialPageRoute(
        builder: (ctx){
          var id = settings.arguments;
          return BookDetailPage(bookId:id ,);
        }
      );
    }
    return null;
  };

  static final RouteFactory unknowRoute = (settings) {
    return null;
  };
}