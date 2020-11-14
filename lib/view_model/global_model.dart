import 'package:flutter/material.dart';

class GlobalModel extends ChangeNotifier{
   static const langList=['zh','en','ms']; //中 英 马来文
   int _count;
   GlobalModel(this._count);

   void add() {
     _count++;
     notifyListeners();//2 通知用到GlobalModel对象的widget刷新用的
   }
   get count => _count;//3

    //   主题色
    static const _themeColor=Color(0xffD27633);

   themeData(){
      var themData=ThemeData(
        accentColor: _themeColor,
        primaryColor:_themeColor
      );
      return themData;
   }
}