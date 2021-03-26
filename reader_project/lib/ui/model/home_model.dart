import 'package:reader_project/ui/model/book_model.dart';

class MenuInfo {
  String title;
  String icon;

  MenuInfo.fromJson(Map data) {
    title = data['toTitle'];
    icon = data['icon'];
  }
}

class BannerInfo {
  String imageUrl;
  String link;

  BannerInfo.fromJson(Map data) {
    imageUrl = data['image_url'];
    link = data['link_url'];
  }
}

class HomeModel {
  String id;
  String name;
  int style;
  List content;

  List<BannerInfo> banners;
  List<MenuInfo> menus;
  List<BookModel> books;

  HomeModel.fromJson(Map data) {
    id = data['id'];
    name = data['m_s_name'];
    content = data['content'];

    if (name == '顶部banner') {
      banners = [];
      content.forEach((data) {
        banners.add(BannerInfo.fromJson(data));
      });
    }

    if (name == '顶部导航') {
      menus = [];
      content.forEach((data) {
        menus.add(MenuInfo.fromJson(data));
      });
    }

    if (data['m_s_style'] != null) {
      style = data['m_s_style'];
      books = [];
      content.forEach((data) {
        books.add(BookModel.fromJson(data));
      });
    }
  }
}