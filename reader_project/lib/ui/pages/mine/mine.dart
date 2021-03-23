// 我的页面
import 'package:flutter/material.dart';
import 'package:reader_project/ui/pages/mine/setting_page.dart';
import 'mine_cell.dart';
import 'mine_header.dart';

class ZJMinePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          MineHeaderView(),
          buildCells(context),
        ],
      ),
    );
  }

  Widget buildCells(BuildContext context) {
    return Container(
      child: Column(
        children: [
          MineCell(
            title: "钱包",
            iconName: "me_wallet.png",
            onPressed: (){

            },
          ),
          MineCell(
            title: "消费充值记录",
            iconName: "me_record.png",
            onPressed: (){

            },
          ),
          MineCell(
            title: "购买的书",
            iconName: "me_buy.png",
            onPressed: (){

            },
          ),
          MineCell(
            title: "我的会员",
            iconName: "me_vip.png",
            onPressed: (){

            },
          ),
          MineCell(
            title: "绑兑换码",
            iconName: "me_coupon.png",
            onPressed: (){

            },
          ),
          MineCell(
            title: "阅读之约",
            iconName: "me_date.png",
            onPressed: (){

            },
          ),
          MineCell(
            title: "公益行动",
            iconName: "me_action.png",
            onPressed: (){

            },
          ),
          MineCell(
            title: "我的收藏",
            iconName: "me_favorite.png",
            onPressed: (){

            },
          ),
          MineCell(
            title: "打赏记录",
            iconName: "me_record.png",
            onPressed: (){

            },
          ),
          MineCell(
            title: "我的书评",
            iconName: "me_comment.png",
            onPressed: (){

            },
          ),
          MineCell(
            title: "个性换肤",
            iconName: "me_theme.png",
            onPressed: (){

            },
          ),
          MineCell(
            title: "设置",
            iconName: "me_setting.png",
            onPressed: (){
              print("执行-----");
              Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                return SettingPage();
              }));
            },
          )
        ],
      ),
    );
  }

}
