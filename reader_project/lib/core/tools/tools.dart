import 'package:flutter/material.dart';
import 'package:reader_project/core/tools/screen.dart';

///value: 文本内容；
///fontSize : 文字的大小；
/// fontWeight：文字权重；
/// maxWidth：文本框的最大宽度；
/// maxLines：文本支持最大多少行;
/// context: 当前界面上下文//GlobalStatic.context
Size calculateTextSize(String value, fontSize, BuildContext context,double maxWidth,{FontWeight fontWeight = FontWeight.normal, int maxLines = 3}) {
  TextPainter painter = TextPainter(
    ///AUTO：华为手机如果不指定locale的时候，该方法算出来的文字高度是比系统计算偏小的。
    locale: Localizations.maybeLocaleOf(context),
    maxLines: maxLines,
    textDirection: TextDirection.ltr,
    text: TextSpan(
      text: value,
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
    ),
  );
  //设置layout
  painter.layout(maxWidth: maxWidth);
  //文字的Size
  return Size(painter.width, painter.height);
}