import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:massageflutterapp/ui/pages/language/language.dart';
import 'package:massageflutterapp/ui/pages/login/login.dart';
import 'package:massageflutterapp/ui/pages/login/register_word.dart';
import 'package:massageflutterapp/ui/pages/tab/index.dart';
import 'package:massageflutterapp/ui/pages/login/register.dart';
import 'package:massageflutterapp/ui/pages/login/forget_password.dart';
class RouteName {
  static const String login = 'login';
  static const String tab = 'tab';
  static const String language='language';
  static const String register='register';
  static const String registerWord='registerWord';//隐私政策
  static const String forgetPassword='forgetPassword';
}

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
   print(settings.name);
    switch (settings.name) {
      case RouteName.login:
        return CupertinoPageRoute(builder: (_) => LoginPage());
     case RouteName.tab:
        return CupertinoPageRoute(builder: (_) => TabNavigator());
      case RouteName.language:
        return CupertinoPageRoute(builder: (_) => LanguagePage());
      case RouteName.register:
      return CupertinoPageRoute(builder: (_) => RegisterPage());
      case RouteName.registerWord:
        return CupertinoPageRoute(builder: (_) => RegisterWordPage());
      case RouteName.forgetPassword:
        var list = settings.arguments as List;
        String phone = list[0];
        return CupertinoPageRoute(builder: (_) => ForgetPasswordPage(phone));
      default:
        return CupertinoPageRoute(
            builder: (_) => Scaffold(body: Center(child: Text('No route defined for ${settings.name}'))));
    }
  }
}
