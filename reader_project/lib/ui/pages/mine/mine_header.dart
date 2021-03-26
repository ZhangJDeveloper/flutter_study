import 'package:flutter/material.dart';

class MineHeaderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

      },

      child: Container(
        padding: EdgeInsets.fromLTRB(20, 30, 15, 15),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(
                  "assets/images/2.0x/placeholder_avatar.png"),
            ),
            SizedBox(width: 25,),
            Expanded(
                child: Column(                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("登录", style: TextStyle(fontSize: 18),),
                    SizedBox(height: 10,),
                    buildItems(),
                  ],
                )
            )
          ],
        ),
      ),
    );
  }

  Widget buildItems() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildItem("0.0", "书豆余额"),
        buildItem("0", "书券（张）"),
        buildItem("0", "月票"),
        Container(),
      ],
    );
  }


  Widget buildItem(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
        SizedBox(height: 5,),
        Text(
          subtitle, style: TextStyle(fontSize: 12, color: Color(0xFF888888)),)
      ],
    );
  }

}