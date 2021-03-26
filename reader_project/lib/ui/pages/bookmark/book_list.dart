import 'package:flutter/material.dart';
import 'package:reader_project/core/services/request.dart';
import 'package:reader_project/ui/model/home_model.dart';
import 'package:reader_project/ui/pages/bookmark/banner_view.dart';
import 'package:reader_project/ui/pages/bookmark/book_first_cell.dart';
import 'package:reader_project/ui/pages/bookmark/book_four_cell.dart';
import 'package:reader_project/ui/pages/bookmark/book_third_cell.dart';
import 'package:reader_project/ui/pages/bookmark/menu_view.dart';

import 'book_second_cell.dart';
enum BookListType {
  excellent,
  male,
  female,
  cartoon,
}

class BookListView extends StatefulWidget {
  final BookListType type;

  BookListView(this.type);

  @override
  _BookListViewState createState() => _BookListViewState();
}

class _BookListViewState extends State<BookListView> {
  List<HomeModel> models = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      var action;
      switch (this.widget.type) {
        case BookListType.excellent:
          action = "home_excellent";
          break;
        case BookListType.female:
          action = "home_female";
          break;
        case BookListType.male:
          action = "home_male";
          break;
        case BookListType.cartoon:
          action = "home_cartoon";
          break;
        default:
          break;
      }

      var response = await Request.get(action: action);
      List datas = response['module'];
      List<HomeModel> models = [];
      datas.forEach((element) {
        models.add(HomeModel.fromJson(element));
      });

      setState(() {
        this.models = models;
      });

    }catch(e){
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RefreshIndicator(
        onRefresh: fetchData,
        child: ListView.builder(
            itemCount: models.length,
            itemBuilder: (BuildContext context, int index){
              return buildModule(context, models[index]);
            },
        ),
      ),
    );
  }

  Widget buildModule(BuildContext context, HomeModel model) {
    if(model.banners != null) {
      return BannerView(banners: model.banners,);
    } else if(model.menus != null) {
      return MenuView(model.menus);
    } else if(model.books != null) {
      return viewWithModel(model);
    }
    return Container();
  }

  Widget viewWithModel(HomeModel model) {
    var view;
    switch (model.style) {
      case 1:
        view = BookFirstCell(model);
        break;
      case 2:
        view = BookSecondCell(model);
        break;
      case 3:
        view = BookThirdCell(model);
        break;
      case 4:
        view = BookFourCell(model);
        break;
    }

    return view;
  }
}
