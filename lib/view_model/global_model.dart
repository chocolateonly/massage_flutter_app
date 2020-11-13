import 'package:flutter/material.dart';

class GlobalModel extends ChangeNotifier{
   static const langList=['zh-CN','en','my'];
   int _count;
   GlobalModel(this._count);

   void add() {
     _count++;
     notifyListeners();//2 通知用到GlobalModel对象的widget刷新用的
   }
   get count => _count;//3

}