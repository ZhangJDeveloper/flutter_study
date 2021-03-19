import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'initialize_app.dart';
import 'package:dio/dio.dart';

class ZJMainScreen extends StatefulWidget {
  static const String routeName = "/";

  @override
  _ZJMainScreenState createState() => _ZJMainScreenState();
}

class _ZJMainScreenState extends State<ZJMainScreen> {
  int _currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getData();

  }

   Future getData() async {
  //   var httpClient = new HttpClient();
  //   var uri = Uri(
  //       scheme: 'https',
  //       host: 'baidu.com',);
  //
  //   HttpClientRequest request = await httpClient.getUrl(uri);
  //   request.headers.add('name', 'value');
  //   HttpClientResponse response = await request.close();
  //   String responseBody = await response.transform(utf8.decoder).join();
  //   print('responseBody:$responseBody');
  //   setState(() {
  //     print(responseBody) ;
  //   });
     //Response response = await Dio().get("http://www.baidu.com");
     //print(response);
   }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: pages,
        index: _currentIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(  //BottomNavigationBar
        items: items,
        //activeColor:Color(0xFF23B38E),
        currentIndex: _currentIndex,
        unselectedFontSize: 12.0,
        selectedFontSize: 12.0,
        selectedItemColor:Color(0xFF23B38E) ,
        type:BottomNavigationBarType.fixed ,
        onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
        },
      ),
    );
  }
}
