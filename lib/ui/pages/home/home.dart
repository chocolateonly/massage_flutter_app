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
        height: 260.px,
        decoration:BoxDecoration(
            color:Colors.transparent  //背景颜色 Theme.of(context).accentColor
        ),
        child: Stack(
          children: <Widget>[
            Container(
              height: 100.px,
              decoration:BoxDecoration(
                  color:Theme.of(context).accentColor //背景颜色 Theme.of(context).accentColor
              ),
            ),
            Container(
              padding:EdgeInsets.symmetric(horizontal:30.rpx),
              child: Row( //搜索 多语言
                children: <Widget>[
                  InkWell(  //水波纹按钮
                    onTap: (){
                      Navigator.of(context).pushNamed(RouteName.language);
                    },
                    child: Container(
                      width: 130.rpx,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              constraints:BoxConstraints(maxWidth: 100.rpx),//给最大宽
                              child: Text(getLanguage(context),style: TextStyle(color: Colors.white),overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,)
                          ),
                          Image.asset(
                            ImageHelper.wrapAssets("icon_check_language.png"),
                            height: 30.rpx,
                          ),
                        ],
                      ),
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
            Positioned(
              top:30.rpx,
              left:30.rpx,
              right:30.rpx,
              height:558.rpx,
              child:  Image.asset(
                ImageHelper.wrapAssets("home_banner.png"),
                height: 558.rpx,
              ),
            ),
          ],
        ),
      )
    );
  }
}
