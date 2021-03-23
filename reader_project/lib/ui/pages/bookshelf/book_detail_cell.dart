import 'package:flutter/material.dart';

class BookDetailCell extends StatelessWidget {
  final String iconName;
  final String title;
  final String subtitle;
  final Widget attachedWidget;


  BookDetailCell({this.iconName, this.title, this.subtitle, this.attachedWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Divider(height: 1,),
          Container(
            height: 50,
            child: Row(
              children: [
                Image.asset("assets/images/2.0x/$iconName",width: 20,),
                SizedBox(width: 5,),
                Text(title, style: TextStyle(fontSize: 16),),
                SizedBox(width: 10,),
                Expanded(child: Text(subtitle, style: TextStyle(fontSize: 14, color: Color(0xFF888888)),maxLines: 1,overflow: TextOverflow.ellipsis,)),
                attachedWidget != null ? attachedWidget:Container(),
                SizedBox(width: 5,),
                Image.asset('assets/images/2.0x/arrow_right.png',width: 7,),
              ],
            ),
          ),
          Divider(height: 1,),
        ],
      ),
    );
  }
}
