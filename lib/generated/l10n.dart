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