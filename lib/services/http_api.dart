import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:massageflutterapp/view_model/locale_model.dart';
import 'package:massageflutterapp/view_model/user_model.dart';

import 'package:massageflutterapp/config/storage_manager.dart';
import 'api.dart';
import 'package:oktoast/oktoast.dart';
import 'package:massageflutterapp/ui/widgets/loading/loading_wrap.dart';
final Http http = Http();

class Http extends BaseHttp {
  static const CONTENT_TYPE_FORM = 'application/x-www-form-urlencoded';
  static const baseUrl = 'http://peiwan.dev.hbbeisheng.com/';
  @override
  void init() {
    options.baseUrl = baseUrl;
    options.contentType = options.contentType ?? CONTENT_TYPE_FORM;

    interceptors
      ..add(ApiInterceptor())
      // cookie持久化 异步
      ..add(CookieManager(PersistCookieJar(dir: StorageManager.temporaryDirectory.path)));
  }
}

/// 玩Android API
class ApiInterceptor extends InterceptorsWrapper {
  String uid, token;
  bool loading;
  bool isFrom;
  @override
  onRequest(RequestOptions options) async {
    print('options-----------');
    uid = StorageManager.sharedPreferences.getString(UserModel.userId);
    token = StorageManager.sharedPreferences.getString(UserModel.userToken);
    isFrom = options.data is FormData;
    if (!isFrom) {
      options.data['timestamp'] = new DateTime.now().millisecondsSinceEpoch.toString();
      int _localeIndex = StorageManager.sharedPreferences.getInt(LocaleModel.kLocaleIndex) ?? 0;
      options.data['lang'] = LocaleModel.localeValueList[_localeIndex];
    }
    if (uid != null) {
      try {
        if (!isFrom) {
          options.data['uid'] = uid;
          options.data['token'] = token;
        } else {
//          options.contentType ="multipart/form-data";
        }
      } catch (e) {
        print(e.toString());
      }
    }
    //    加载动画
    loading=!isFrom?options.data['loading']:false;
   if(loading&&!isFrom) LoadingWrap.before(options.uri, '');
    debugPrint('---api-request--->url--> ${options.baseUrl}${options.path}' + ' json: ${options.data}');
    return options;
  }

  @override
  Future onError(DioError err) {
    //加载动画完成
    if(loading&&!isFrom) LoadingWrap.complete(err.request.uri);
    debugPrint('---api-request--->data--->${err.toString()}');
    return super.onError(err);
  }

  @override
  onResponse(Response response) {
    debugPrint('---api-response--->resp----->${response.data}');
    ResponseData respData = ResponseData.fromJson(response.data);
     //加载动画完成
    if(loading&&!isFrom) LoadingWrap.complete(response.request.uri);

    if (respData.success) {
      if(respData.code=="201"){
        showToast(respData.message);
      }
      response.data = respData.data;
      return http.resolve(response);
    } else {
      if (respData.code == "401") {
        // 如果cookie过期,需要清除本地存储的登录信息
        StorageManager.localStorage.deleteItem(UserModel.kUser);
        throw const UnAuthorizedException(); // 需要登录
      } else {
        throw NotSuccessException.fromRespData(respData);
      }
    }
  }
}

class ResponseData extends BaseResponseData {
  bool get success => "200" == code || code == "300" || code == "201";

  ResponseData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['msg'];
    if (json["data"] is List) {
      data = {"lists": json["data"]};
    } else
      data = json['data'];
  }
}
