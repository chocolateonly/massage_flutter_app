import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:massageflutterapp/ui/pages/language/language.dart';
import 'package:massageflutterapp/ui/pages/login/login.dart';
import 'package:massageflutterapp/ui/pages/login/register_word.dart';
import 'package:massageflutterapp/ui/pages/mine/application_form.dart';
import 'package:massageflutterapp/ui/pages/tab/index.dart';
import 'package:massageflutterapp/ui/pages/login/register.dart';
import 'package:massageflutterapp/ui/pages/login/forget_password.dart';
import 'package:massageflutterapp/ui/pages/mine/my_order_list.dart';
import 'package:massageflutterapp/ui/pages/mine/my_info.dart';
import 'package:massageflutterapp/ui/pages/mine/settings.dart';
import 'package:massageflutterapp/ui/pages/mine/agreement_file.dart';
import 'package:massageflutterapp/ui/pages/mine/order/order_detail.dart';

class RouteName {
  static const String login = 'login';
  static const String tab = 'tab';
  static const String language='language';
  static const String register='register';
  static const String registerWord='registerWord';//隐私政策
  static const String forgetPassword='forgetPassword';//忘记密码  修改密码
  static const String myInfo='myInfo';//编辑个人信息
  static const String settings='settings';//设置
  static const String myCombo='myCombo';//我的套餐
  static const String myOrderList='myOrderList';//我的订单列表
  static const String applicationForm='applicationForm';//应聘表格
  static const String promotionGift='promotionGift';//推广好礼
  static const String myPoint='myPoint';
  static const String healthyInfo='healthyInfo';
  static const String myEarnings='myEarnings';
  static const String myOrganization='myOrganization';
  static const String myComments='myComments';
  static const String myAddress='myAddress';
  static const String myCollection='myCollection';
  static const String workPlatform='workPlatform';
  static const String agreementFile='agreementFile'; //关于平台  隐私协议   用户协议
  static const String orderDetail='orderDetail';//订单详情
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
        var type=list[0];
        return CupertinoPageRoute(builder: (_) => ForgetPasswordPage(type));
      case RouteName.myInfo:
        return CupertinoPageRoute(builder: (_) => MyInfoPage());
      case RouteName.settings:
        return CupertinoPageRoute(builder: (_) => SettingsPage());
      case RouteName.agreementFile:
        var list = settings.arguments as List;
        var type=list[0];
        var title=list[1];
        return CupertinoPageRoute(builder: (_) => AgreementFilePage(type,title));
      case RouteName.myOrderList:
        var list = settings.arguments as List;
        var type=list[0];
        return CupertinoPageRoute(builder: (_) => MyOrderListPage(type));
      case RouteName.orderDetail:
        var list = settings.arguments as List;
        var id=list[0];
        return CupertinoPageRoute(builder: (_) => OrderDetailPage(id));
      default:
        return CupertinoPageRoute(
            builder: (_) => Scaffold(body: Center(child: Text('No route defined for ${settings.name}'))));
    }
  }
}
