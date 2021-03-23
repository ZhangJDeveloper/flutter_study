import 'package:flutter/material.dart';

class MineCell extends StatelessWidget {
  final VoidCallback onPressed;
  final String iconName;
  final String title;


  MineCell({this.onPressed, this.iconName, this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: 60,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Image.asset("assets/images/2.0x/$iconName",width: 20,),
                    SizedBox(width: 20,),
                    Text(title,style: TextStyle(fontSize: 16),),
                    Expanded(child: Container()),
                    Image.asset("assets/images/2.0x/arrow_right.png",width: 7.5,)
                  ],
                ),
              ),
              Divider(height: 1,indent: 60,color:Color(0xFFEEEEEE)),
            ],
          ),

        )
    );
  }
}

