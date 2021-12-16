import 'package:flutter/material.dart';
import 'package:massageflutterapp/config/storage_manager.dart';
import 'package:massageflutterapp/services/http_utils.dart';
class GlobalModel extends ChangeNotifier {
  static const langList = ['zh', 'en', 'ms']; //中 英 马来文

  //   主题色
  static const _themeColor = Color(0xffD27633);

  get themeColor => _themeColor;
//  明暗
  bool themeDark=StorageManager.sharedPreferences.getString('theme')=='dark';
  get isDark=>themeDark;
  switchTheme(isDark){
    themeDark=isDark;
    notifyListeners();
    StorageManager.sharedPreferences.setString('theme', isDark?'dark':'light');
  }

  themeData() {
//    var themeData = ThemeData(
//        accentColor: _themeColor, //修改文字颜色
//        primaryColor: _themeColor //修改背景主题色
//
//        );
//    themeData = themeData.copyWith(
//      appBarTheme: themeData.appBarTheme.copyWith(elevation: 0), //去掉导航阴影
//    );

    final ThemeData lightTheme = new ThemeData(
      primarySwatch: Colors.purple,
      brightness: Brightness.light,
      accentColor: Colors.deepPurpleAccent[100],
      primaryColor: Colors.white,
      primaryColorLight: Colors.purple[700],
      textSelectionHandleColor: Colors.purple[700],
      dividerColor: Colors.grey[200],
      bottomAppBarColor: Colors.grey[200],
      buttonColor: Colors.purple[700],
      iconTheme: new IconThemeData(color: Colors.white),
      primaryIconTheme: new IconThemeData(color: Colors.black),
      accentIconTheme: new IconThemeData(color: Colors.purple[700]),
      disabledColor: Colors.grey[500],
    );

    final ThemeData darkTheme = new ThemeData(
      primarySwatch: Colors.purple,
      brightness: Brightness.dark,
      accentColor: Colors.deepPurpleAccent[100],
      primaryColor: Color.fromRGBO(50, 50, 57, 1.0),
      primaryColorLight: Colors.deepPurpleAccent[100],
      textSelectionHandleColor: Colors.deepPurpleAccent[100],
      buttonColor: Colors.deepPurpleAccent[100],
      iconTheme: new IconThemeData(color: Colors.white),
      accentIconTheme: new IconThemeData(color: Colors.deepPurpleAccent[100]),
      cardColor: Color.fromRGBO(55, 55, 55, 1.0),
      dividerColor: Color.fromRGBO(60, 60, 60, 1.0),
      bottomAppBarColor: Colors.black26,
    );

    final theme=  StorageManager.sharedPreferences.getString('theme');
    return theme=='light'? lightTheme:darkTheme;
  }

}
