import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier{
  static const String userId = 'userId';
  static const String userToken = 'userToken';
  static const String kUser = 'kUser';

  static const isExit = false;

  bool get hasUser => isExit;
}