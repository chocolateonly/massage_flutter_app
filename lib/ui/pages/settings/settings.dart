import 'package:flutter/material.dart';
import 'package:massageflutterapp/config/router_manager.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/view_model/global_model.dart';
import 'package:provider/provider.dart';
class SettingDrawer extends StatefulWidget {
  @override
  _SettingDrawerState createState() => _SettingDrawerState();
}

class _SettingDrawerState extends State<SettingDrawer> {
  @override
  Widget build(BuildContext context) {
    var themeModelData=Provider.of<GlobalModel>(context);
    return  new Scaffold(
      bottomNavigationBar: new Container(
          decoration: new BoxDecoration(
              border: new Border(
                top: new BorderSide(
                    color: Theme.of(context).bottomAppBarColor),
              )),
          child: new ListTile(
            onTap: (){
              print('object');
              themeModelData.switchTheme(!themeModelData.isDark);
            },
            leading: new Icon(
                themeModelData.isDark
                    ? Icons.brightness_3
                    : Icons.brightness_7,
                color: Theme.of(context).buttonColor),
            title: new Text(themeModelData.isDark?
            S.of(context).dark:
            S.of(context).light,
                style: Theme.of(context)
                    .textTheme
                    .body2
                    .apply(color: Theme.of(context).buttonColor)),
          )),
      body:  ListView(
        children: [
          new ListTile(
            leading: new Icon(Icons.settings),
            title: new Text(S.of(context).settings),
            onTap: () => Navigator.of(context).pushNamed(RouteName.language),
          ),
        ],
      ));
  }
}
