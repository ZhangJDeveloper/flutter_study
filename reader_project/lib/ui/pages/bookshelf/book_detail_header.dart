import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:reader_project/core/tools/screen.dart';
import 'package:reader_project/ui/model/book_model.dart';
import 'dart:ui' as ui;

class BookDetailHeader extends StatelessWidget {
  final BookModel model;
  BookDetailHeader(this.model);

  @override
  Widget build(BuildContext context) {
    var width = Screen.width;
    var height = Screen.topSafeHeight + 218.0;
    return Container(
      width: width,
      height: height,
      child: Stack(
        children: [
          Image(
            image: CachedNetworkImageProvider(model.imgUrl),
              fit: BoxFit.fitWidth,
            width: width,
            height: height,
          ),
          Container(color: Color(0xbb000000), width: width, height: height),
          BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: buildContent(context),
          )
        ],
      ),
    );
  }

 Widget buildContent(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(15, 54+Screen.topSafeHeight, 10, 0),
      color: Colors.transparent,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Image(
            image: CachedNetworkImageProvider(model.imgUrl),
            fit: BoxFit.cover,
            width: 100,
            height: 133,
          ),
            SizedBox(width: 15,),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Text(model.name, style: TextStyle(fontSize: 18 / Screen.textScaleFactor, color: Colors.white, fontWeight: FontWeight.bold),),
                    SizedBox(height: 10),
                    Text(model.author, style: TextStyle(fontSize: 14 / Screen.textScaleFactor, color: Colors.white),),
                    SizedBox(height: 10),
                    Text("${model.wordCount}万字 ${model.price}书豆/千字",style: TextStyle(fontSize: 14 / Screen.textScaleFactor, color: Colors.white)),
                    SizedBox(height: 10),
                    buildScore(),
                    SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/2.0x/read_icon_vip.png",width: 25,),
                        Text("续费包月会员，万本小说免费读 >",style: TextStyle(fontSize: 13 / Screen.textScaleFactor, color: Color(0xFFFEA900)),maxLines: 1,)
                      ],
                    ),

              ]
              ),
            ),

          ]
      ),
    );
  }

  Widget buildScore(){
    List<Widget> children = [Text("评分: ${model.score}", style: TextStyle(fontSize: 14 / Screen.textScaleFactor, color: Color(0xfff8e71c)),)];
    var star = model.score;
    children.add(SizedBox(width: 5));
    for (var i = 0; i < 5; i++){
      if(star < i) {
        break;
      }
      var img;
      if(star <= i + 0.5) {
        img = Image.asset('assets/images/2.0x/detail_star_half.png',width: 12,);
      }else {
        img = Image.asset('assets/images/2.0x/detail_star.png',width: 12);
      }
      children.add(img);
      children.add(SizedBox(width: 5));
    }
    return Row(
      children: children,
    );
  }

}
