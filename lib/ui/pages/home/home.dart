import 'package:flutter/material.dart';
import 'package:massageflutterapp/config/resouce_manager.dart';
import 'package:massageflutterapp/config/router_manager.dart';
import 'package:massageflutterapp/config/storage_manager.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:provider/provider.dart';
import 'package:massageflutterapp/view_model/locale_model.dart';
import 'package:massageflutterapp/utils/size_fit.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(S.of(context).homeTitle),
      ),
      body: Container(
         height: 100.px,
         padding:EdgeInsets.symmetric(horizontal:30.rpx),
         decoration:BoxDecoration(
             color:Colors.red  //背景颜色
         ),
         child: Row(
           children: <Widget>[
             InkWell(
               onTap: (){
                 Navigator.of(context).pushNamed(RouteName.language);
               },
               child: Row(
                 children: <Widget>[
                    Text(getLanguage(context),style: TextStyle(color: Colors.white),),
                   Image.asset(
                     ImageHelper.wrapAssets("icon_check_language.png"),
                     height: 30.rpx,
                   ),
                 ],
               ),
             ),
             Expanded(
               child: Container(
                 decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(20),
                 ),
                 padding:EdgeInsets.symmetric(horizontal: 20.rpx),
                 height: 80.rpx,
                 margin:EdgeInsets.only(left:20.rpx),
                 child: Row(
                   children: <Widget>[
                     Text('搜索')
                   ],
                 ),
               ),
             )
           ],
         ),
      ),
    );
  }
}
