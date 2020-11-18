import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:massageflutterapp/view_model/locale_model.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'package:massageflutterapp/config/provider_manager.dart';
import 'view_model/global_model.dart';
import 'view_model/user_model.dart';
import 'config/router_manager.dart';
import 'utils/size_fit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart'; //添加语言包：https://blog.csdn.net/u011272795/article/details/108114487
import 'package:massageflutterapp/config/storage_manager.dart';
import 'package:flutter/services.dart'; //修改状态栏相关
import 'package:pull_to_refresh/pull_to_refresh.dart';
void main() async {
  SizeFit.initialize(); //单位适配
  WidgetsFlutterBinding.ensureInitialized(); //将组件和flutter绑定？
  await StorageManager.init();//本地存储初始化
  // Android状态栏透明 splash为白色,所以调整状态栏文字为黑色
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarBrightness: Brightness.light));
  runApp(App());
}
/*
* provider使用
* 1添加依赖
* 2.创建共享数据类
* 3.Provider 获取数据状态有两种方式：
使用 Provider.of(context) 获取 DataInfo
使用 Consumer
不过这两种方式都需要在顶层套上ChangeNotifierProvider():
* 根据userModel.hasUser true false 切换页面
* 建立tabNavigation
* 多语言添加
* */
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MultiProvider( //状态管理
          providers: providers,
          child:Consumer2<GlobalModel,LocaleModel>(builder: (context,globalModel,localeModel,child){  //Consumer  Consumer2对应model个数
            //刷新加载列表配置
            return RefreshConfiguration(
              hideFooterWhenNotFull: true, //列表数据不满一页,不触发加载更多
              child: MaterialApp(
                  debugShowCheckedModeBanner: false, //删除页面右上角debug
                  onGenerateRoute: Router.generateRoute,//回调参数提供路由
                  initialRoute:getInitRoute(context), //初始路由设置

                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate
                ],
                supportedLocales: S.delegate.supportedLocales,
                locale: localeModel.locale, //设置本地语言
                localeListResolutionCallback: (locales, supportedLocales) {
                  print(locales);
                  print(supportedLocales);
                  return;
                },
                theme: globalModel.themeData(),
              ),
            );
          })
      ),
    );
  }

 String getInitRoute(BuildContext context) {
   var userModel = Provider.of<UserModel>(context);
   String routeName;
   if (userModel.hasUser) {
     routeName = RouteName.tab;
   } else
     routeName = RouteName.login;
   return routeName;
 }
}

