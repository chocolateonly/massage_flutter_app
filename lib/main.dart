import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:massageflutterapp/config/provider_manager.dart';
import 'view_model/global_model.dart';
import 'view_model/user_model.dart';
import 'config/router_manager.dart';
void main() {
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
* */
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: providers,
        child:Consumer<GlobalModel>(builder: (context,globalModel,child){  //Consumer  Consumer2对应model个数
          return MaterialApp(
              onGenerateRoute: Router.generateRoute,//回调参数提供路由
              initialRoute:getInitRoute(context) //初始路由设置
          );
        })
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

