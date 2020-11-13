import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:massageflutterapp/ui/pages/login/login.dart';
import 'package:massageflutterapp/ui/pages/tab/index.dart';

class RouteName {
  static const String login = 'login';
  static const String tab = 'tab';
}

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
   print(settings.name);
    switch (settings.name) {
      case RouteName.login:
        return CupertinoPageRoute(builder: (_) => LoginPage());
     case RouteName.tab:
        return CupertinoPageRoute(builder: (_) => TabNavigator());
      default:
        return CupertinoPageRoute(
            builder: (_) => Scaffold(body: Center(child: Text('No route defined for ${settings.name}'))));
    }
  }
}
