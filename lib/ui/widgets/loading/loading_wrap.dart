import 'package:flutter/material.dart';
import 'Loading.dart';
//!!!每个用到的地方加  LoadingWrap.ctx=context;
// 需要加载时，全局加载context配置
Set dict = Set();
bool loadingStatus = false;
class LoadingWrap {
  static dynamic ctx;

  static void before(uri, text) {
    dict.add(uri); // 放入set变量中
    // 已有弹窗，则不再显示弹窗, dict.length >= 2 保证了有一个执行弹窗即可，
    if (loadingStatus == true || dict.length >= 2) {
      return ;
    }
    loadingStatus = true; // 修改状态
    // 请求前显示弹窗
    showDialog(
      context: ctx,
      barrierDismissible:false,//点击遮罩是否关闭
      builder: (context) {
        return Loading(text);
      },
    );
  }

  static void complete(uri) {
    dict.remove(uri);
    // 所有接口接口返回并有弹窗
    if (dict.length == 0 && loadingStatus == true) {
      loadingStatus = false; // 修改状态
      // 完成后关闭loading窗口
      Navigator.of(ctx, rootNavigator: true).pop();
    }
  }
}

/*
* dio.dart

onReuest: Loading.before(options.uri, '正在加速中...');
onReponse: Loading.complete(resp.request.uri);
onError: Loading.complete(error.request.uri );

* */