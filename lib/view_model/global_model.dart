import 'package:flutter/material.dart';
import 'package:massageflutterapp/services/http_utils.dart';
class GlobalModel extends ChangeNotifier {
  static const langList = ['zh', 'en', 'ms']; //中 英 马来文

  //   主题色
  static const _themeColor = Color(0xffD27633);

  get themeColor => _themeColor;

  themeData() {
    var themeData = ThemeData(
        accentColor: _themeColor, //修改文字颜色
        primaryColor: _themeColor //修改背景主题色

        );
    themeData = themeData.copyWith(
      appBarTheme: themeData.appBarTheme.copyWith(elevation: 0), //去掉导航阴影
    );
    return themeData;
  }

}
