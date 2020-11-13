import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier{
  static const isExit = true;

  bool get hasUser => isExit;
}