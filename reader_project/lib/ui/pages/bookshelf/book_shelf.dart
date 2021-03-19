// 书架页面
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:reader_project/core/services/request.dart';
import 'package:reader_project/core/tools/screen.dart';
import 'package:reader_project/ui/model/book_model.dart';

import 'book_item.dart';
import 'book_shelf_header.dart';


/*const CupertinoSliverRefreshControl({
Key key,
this.refreshTriggerPullDistance = _defaultRefreshTriggerPullDistance,///触发刷新的距离
this.refreshIndicatorExtent = _defaultRefreshIndicatorExtent,///刷新指示器范围
/// 根据 刷新状态和距离返回一个Widget ,这个就是自定义的布局
this.builder = buildRefreshIndicator,
/// 触发刷新后的回调
this.onRefresh,
})

/// 上面那个builder 方法
typedef RefreshControlIndicatorBuilder = Widget Function(
    BuildContext context,
    RefreshIndicatorMode refreshState,///刷新状态
    double pulledExtent,///已下拉的距离
    double refreshTriggerPullDistance,///下拉多杀触发刷新
    double refreshIndicatorExtent,///下拉刷新过程中等待刷新的距离
    );*/

class ZJBookShelfPage extends StatefulWidget {
  @override
  _ZJBookShelfPageState createState() => _ZJBookShelfPageState();
}

class _ZJBookShelfPageState extends State<ZJBookShelfPage> {
  ScrollController _controller;
  double navAlpha = 0.0;
  List<BookModel> books = [];
  @override
  void initState() {
    // TODO: implement initState
    _controller = ScrollController();
    fetchData();
    // 监听滚动
    _controller.addListener(() {
      var offset = _controller.offset;
      if(offset < 0) {
        if(navAlpha != 0) {
          setState(() {
            navAlpha = 0.0;
          });
        }
      } else if(offset < 50 ) {
        setState(() {
          navAlpha = 1 - (50 - offset) / 50;
        });
      }else if (navAlpha != 1) {
        setState(() {
          navAlpha = 1;
        });
      }
    });

    super.initState();
  }

  Future<void> fetchData() async {
    try {
      books = [];
      List<dynamic> datas = await Request.get(action: "bookshelf");
      datas.forEach((element) {
        books.add(BookModel.fromJson(element));
      });
      books.add(BookModel());
      setState(() {});
    }catch (e) {

    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          // appBar: AppBar(
          //   title: Text("书架"),
          //   // toolbarOpacity: 0.0,
          //   elevation: 0,   // 隐藏阴影
          //   backgroundColor: Colors.orange,
          // ),
      body:Stack(   // Stack 可叠加
        children:[
          CustomScrollView(
            controller: _controller,
            slivers: <Widget>[
              CupertinoSliverRefreshControl(
                refreshIndicatorExtent: (60 + Screen.topSafeHeight),/// 刷新过程中悬浮高度
                refreshTriggerPullDistance: 65 + Screen.topSafeHeight,///触发刷新的距离
                builder: (context,refreshState,pulledExtent,refreshTriggerPullDistance,refreshIndicatorExtent){
                  // String str = "下拉刷新";
                  // if (refreshState == RefreshIndicatorMode.inactive){
                  //     str = "正在刷新";
                  //     print("1111111");
                  // }else if(refreshState == RefreshIndicatorMode.armed){
                  //   print("22222");
                  // }else if(refreshState == RefreshIndicatorMode.done){
                  //   print("33333");
                  // }else if(refreshState == RefreshIndicatorMode.drag){
                  //   print("44444");
                  // }else {
                  //   print("55555");
                  // }
                  return Container(
                    height: 150,
                    // color: Colors.blue,
                    child: Center(
                      child:
                          CupertinoActivityIndicator(
                            radius: 15,
                          ),
                           // SizedBox(height: 3.0,),
                           // Text("刷新..."),
                        ),
                    );
                },
                onRefresh: () async {
                  //模拟网络请求
                  await Future.delayed(Duration(seconds: 3));
                  //结束刷新
                  return Future.value(true);
                },
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate((content, index) {
                  return Container(
                    child: books.length > 0 ? BookshelfHeader(book: books[0],) : Container(),
                  );
                }, childCount: 1),
              ),
              SliverPadding(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, crossAxisSpacing: 20, mainAxisSpacing: 15, childAspectRatio:0.6),
                  delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                    if (index + 1 == books.length){
                      return Container(
                        color: Color(0xFFF5F5F5),
                        child: Image.asset('assets/images/2.0x/bookshelf_add.png'),
                      );
                    }else {
                      BookModel model = books[index];
                      return BookItem(model: model,);
                    }
                  }, childCount: books.length),
                ),
              ),

            ],
          ),
          buildNavigationBar(),
        ],
      )
    );
  }

  Widget buildNavigationBar(){
    return Opacity(
        opacity: navAlpha,
        child: Container(
          height: Screen.navigationBarHeight,
          child: AppBar(
            title: Text("书架"),
          ),
        ),
    );
  }
}

