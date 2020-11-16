// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ms locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ms';

  static m0(num) => "${num}秒后重新获取";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "forgetPassword" : MessageLookupByLibrary.simpleMessage("忘记密码"),
    "getCode" : MessageLookupByLibrary.simpleMessage("获取验证码"),
    "getCodeTip" : m0,
    "homeTitle" : MessageLookupByLibrary.simpleMessage("Home"),
    "language" : MessageLookupByLibrary.simpleMessage("Language"),
    "login" : MessageLookupByLibrary.simpleMessage("登录"),
    "messageLogin" : MessageLookupByLibrary.simpleMessage("短信登录"),
    "passwordLogin" : MessageLookupByLibrary.simpleMessage("密码登录"),
    "passwordPlaceholder" : MessageLookupByLibrary.simpleMessage("请输入密码"),
    "phonePlaceholder" : MessageLookupByLibrary.simpleMessage("请输入手机号"),
    "registerUser" : MessageLookupByLibrary.simpleMessage("注册账户"),
    "search" : MessageLookupByLibrary.simpleMessage("search"),
    "searchPlaceholder" : MessageLookupByLibrary.simpleMessage("please input"),
    "tab1" : MessageLookupByLibrary.simpleMessage("ssHome"),
    "tab2" : MessageLookupByLibrary.simpleMessage("Order"),
    "tab3" : MessageLookupByLibrary.simpleMessage("Message"),
    "tab4" : MessageLookupByLibrary.simpleMessage("Mine"),
    "thirdLogin" : MessageLookupByLibrary.simpleMessage("第三方账号登录")
  };
}
