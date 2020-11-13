import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:massageflutterapp/config/provider_manager.dart';
import 'view_model/global_model.dart';
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
* */
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: providers,
        child:Consumer<GlobalModel>(builder: (context,globalModel,child){  //Consumer  Consumer2对应model个数
          return MaterialApp(
            home:Scaffold(
               body:Center(
                 child: Text(globalModel.count.toString()),//值的获取
               ),
              floatingActionButton: FloatingActionButton(
                onPressed: ()=>globalModel.add(), //方法的调用
                tooltip: '数字点击加1',
                child: Icon(Icons.add),
              ),
            )
          );
        })
    );
  }
}


