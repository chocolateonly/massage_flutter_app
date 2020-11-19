import 'package:flutter/material.dart';
import 'package:massageflutterapp/config/resouce_manager.dart';
import 'package:massageflutterapp/model/User.dart';
class UserModel extends ChangeNotifier{
  static const String userId = 'userId';
  static const String userToken = 'userToken';
  static const String kUser = 'kUser';

  static var isExit = true;
  User userInfo=User.fromJson({
    "id":"",
    "headpic":ImageHelper.wrapAssets('mine_meal.png'),
    "username":"111",
    "nickname":"222",
    "mobile":"",
    "token":"",
    "uid":""
  });

  bool get hasUser => isExit;
  set setHasUser(val){
    isExit=val;
  }

}