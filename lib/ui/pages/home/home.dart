import 'package:flutter/material.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/view_model/home_model.dart';
import 'package:massageflutterapp/provider/provider_widget.dart';
import 'package:massageflutterapp/ui/pages/settings/settings.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(S.of(context).homeTitle),
      ),
      drawer:new Drawer(
        child:SettingDrawer()
      ),
      body: ProviderWidget<HomeModel>(
        onModelReady: (homeModel){
          //初始化状态是调用页面初始数据
          homeModel.loadHome();
        },
        builder: (context,homeModel,child){
          return NotificationListener(  //页面有输入框时的失焦操作
              onNotification: (ScrollNotification notification) {
                FocusScope.of(context).requestFocus(new FocusNode());
                return true;
              },
              child:Container()
          );
        },
        model: HomeModel(),
      )
    );
  }
}
