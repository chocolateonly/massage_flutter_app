// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Home`
  String get tab1 {
    return Intl.message(
      'Home',
      name: 'tab1',
      desc: '',
      args: [],
    );
  }

  /// `Order`
  String get tab2 {
    return Intl.message(
      'Order',
      name: 'tab2',
      desc: '',
      args: [],
    );
  }

  /// `Message`
  String get tab3 {
    return Intl.message(
      'Message',
      name: 'tab3',
      desc: '',
      args: [],
    );
  }

  /// `Mine`
  String get tab4 {
    return Intl.message(
      'Mine',
      name: 'tab4',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get homeTitle {
    return Intl.message(
      'Home',
      name: 'homeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `search`
  String get search {
    return Intl.message(
      'search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `please input`
  String get searchPlaceholder {
    return Intl.message(
      'please input',
      name: 'searchPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `登录`
  String get login {
    return Intl.message(
      '登录',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `请输入手机号`
  String get phonePlaceholder {
    return Intl.message(
      '请输入手机号',
      name: 'phonePlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `请输入密码`
  String get passwordPlaceholder {
    return Intl.message(
      '请输入密码',
      name: 'passwordPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `请再次输入密码`
  String get confirmPasswordPlaceholder {
    return Intl.message(
      '请再次输入密码',
      name: 'confirmPasswordPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `两次输入密码不一致`
  String get confirmPasswordError {
    return Intl.message(
      '两次输入密码不一致',
      name: 'confirmPasswordError',
      desc: '',
      args: [],
    );
  }

  /// `请输入验证码`
  String get phoneCodePlaceholder {
    return Intl.message(
      '请输入验证码',
      name: 'phoneCodePlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `注册账户`
  String get registerUser {
    return Intl.message(
      '注册账户',
      name: 'registerUser',
      desc: '',
      args: [],
    );
  }

  /// `短信登录`
  String get messageLogin {
    return Intl.message(
      '短信登录',
      name: 'messageLogin',
      desc: '',
      args: [],
    );
  }

  /// `密码登录`
  String get passwordLogin {
    return Intl.message(
      '密码登录',
      name: 'passwordLogin',
      desc: '',
      args: [],
    );
  }

  /// `获取验证码`
  String get getCode {
    return Intl.message(
      '获取验证码',
      name: 'getCode',
      desc: '',
      args: [],
    );
  }

  /// `{num}秒后重新获取`
  String getCodeTip(Object num) {
    return Intl.message(
      '$num秒后重新获取',
      name: 'getCodeTip',
      desc: '',
      args: [num],
    );
  }

  /// `忘记密码`
  String get forgetPassword {
    return Intl.message(
      '忘记密码',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `第三方账号登录`
  String get thirdLogin {
    return Intl.message(
      '第三方账号登录',
      name: 'thirdLogin',
      desc: '',
      args: [],
    );
  }

  /// `注册`
  String get register {
    return Intl.message(
      '注册',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `已经注册？`
  String get hasRegister {
    return Intl.message(
      '已经注册？',
      name: 'hasRegister',
      desc: '',
      args: [],
    );
  }

  /// `注册代表已同意`
  String get registerTip {
    return Intl.message(
      '注册代表已同意',
      name: 'registerTip',
      desc: '',
      args: [],
    );
  }

  /// `《使用条款及隐私政策》`
  String get registerWord {
    return Intl.message(
      '《使用条款及隐私政策》',
      name: 'registerWord',
      desc: '',
      args: [],
    );
  }

  /// `免责声明`
  String get disclaimer {
    return Intl.message(
      '免责声明',
      name: 'disclaimer',
      desc: '',
      args: [],
    );
  }

  /// `提交`
  String get submit {
    return Intl.message(
      '提交',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `编辑`
  String get edit {
    return Intl.message(
      '编辑',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `已购买套餐`
  String get hasBuyCombo {
    return Intl.message(
      '已购买套餐',
      name: 'hasBuyCombo',
      desc: '',
      args: [],
    );
  }

  /// `立即查看`
  String get viewNow {
    return Intl.message(
      '立即查看',
      name: 'viewNow',
      desc: '',
      args: [],
    );
  }

  /// `我的订单`
  String get myOrder {
    return Intl.message(
      '我的订单',
      name: 'myOrder',
      desc: '',
      args: [],
    );
  }

  /// `全部订单`
  String get orderStatus1 {
    return Intl.message(
      '全部订单',
      name: 'orderStatus1',
      desc: '',
      args: [],
    );
  }

  /// `待付款`
  String get orderStatus2 {
    return Intl.message(
      '待付款',
      name: 'orderStatus2',
      desc: '',
      args: [],
    );
  }

  /// `已购买`
  String get orderStatus3 {
    return Intl.message(
      '已购买',
      name: 'orderStatus3',
      desc: '',
      args: [],
    );
  }

  /// `已完成`
  String get orderStatus4 {
    return Intl.message(
      '已完成',
      name: 'orderStatus4',
      desc: '',
      args: [],
    );
  }

  /// `取消中`
  String get orderStatus5 {
    return Intl.message(
      '取消中',
      name: 'orderStatus5',
      desc: '',
      args: [],
    );
  }

  /// `应聘表格`
  String get applicationForm {
    return Intl.message(
      '应聘表格',
      name: 'applicationForm',
      desc: '',
      args: [],
    );
  }

  /// `推广好礼`
  String get promotionGift {
    return Intl.message(
      '推广好礼',
      name: 'promotionGift',
      desc: '',
      args: [],
    );
  }

  /// `我的服务`
  String get myService {
    return Intl.message(
      '我的服务',
      name: 'myService',
      desc: '',
      args: [],
    );
  }

  /// `我的积分`
  String get myPoint {
    return Intl.message(
      '我的积分',
      name: 'myPoint',
      desc: '',
      args: [],
    );
  }

  /// `健康资料`
  String get healthyInfo {
    return Intl.message(
      '健康资料',
      name: 'healthyInfo',
      desc: '',
      args: [],
    );
  }

  /// `我的收益`
  String get myEarnings {
    return Intl.message(
      '我的收益',
      name: 'myEarnings',
      desc: '',
      args: [],
    );
  }

  /// `我的机构`
  String get myOrganization {
    return Intl.message(
      '我的机构',
      name: 'myOrganization',
      desc: '',
      args: [],
    );
  }

  /// `我的评论`
  String get myComments {
    return Intl.message(
      '我的评论',
      name: 'myComments',
      desc: '',
      args: [],
    );
  }

  /// `我的地址`
  String get myAddress {
    return Intl.message(
      '我的地址',
      name: 'myAddress',
      desc: '',
      args: [],
    );
  }

  /// `我的收藏`
  String get myCollection {
    return Intl.message(
      '我的收藏',
      name: 'myCollection',
      desc: '',
      args: [],
    );
  }

  /// `工作台`
  String get workPlatform {
    return Intl.message(
      '工作台',
      name: 'workPlatform',
      desc: '',
      args: [],
    );
  }

  /// `个人资料`
  String get myInfo {
    return Intl.message(
      '个人资料',
      name: 'myInfo',
      desc: '',
      args: [],
    );
  }

  /// `系统设置`
  String get settings {
    return Intl.message(
      '系统设置',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `头像`
  String get avatar {
    return Intl.message(
      '头像',
      name: 'avatar',
      desc: '',
      args: [],
    );
  }

  /// `ID`
  String get ID {
    return Intl.message(
      'ID',
      name: 'ID',
      desc: '',
      args: [],
    );
  }

  /// `电话`
  String get mobile {
    return Intl.message(
      '电话',
      name: 'mobile',
      desc: '',
      args: [],
    );
  }

  /// `性别`
  String get sex {
    return Intl.message(
      '性别',
      name: 'sex',
      desc: '',
      args: [],
    );
  }

  /// `地址`
  String get address {
    return Intl.message(
      '地址',
      name: 'address',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ms'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}