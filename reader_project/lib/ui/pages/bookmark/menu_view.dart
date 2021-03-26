import 'package:flutter/material.dart';
import 'package:reader_project/ui/model/home_model.dart';

class MenuView extends StatelessWidget {
  final List<MenuInfo> infos;

  MenuView(this.infos);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: infos.map((info){
          return menuItem(info);
        }).toList(),
      ),
    );
  }

  Widget menuItem(MenuInfo info) {
    return Column(
      children: [
        Image.asset(info.icon,width: 40,),
        SizedBox(height: 5,),
        Text(info.title, style: TextStyle(fontSize: 12, color: Color(0xFF888888))),
      ],
    );
  }

}
