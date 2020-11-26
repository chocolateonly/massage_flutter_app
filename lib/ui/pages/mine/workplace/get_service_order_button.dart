import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:massageflutterapp/config/resouce_manager.dart';
import 'package:massageflutterapp/utils/size_fit.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/provider/provider_widget.dart';
import 'package:massageflutterapp/ui/pages/mine/order/get_order_button.dart';
import 'package:massageflutterapp/view_model/order_detail_model.dart';
import 'package:massageflutterapp/view_model/my_order_list_model.dart';
import 'package:massageflutterapp/config/router_manager.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:massageflutterapp/view_model/refresh_helper.dart';
Widget getServiceOrderButton(BuildContext context,item,type){
  switch(type) {
    //待服务
  case 1:return Container(
    child: Row(
      children: <Widget>[
        Expanded(
          flex:1,
          child: Container(
            margin: EdgeInsets.all(20.rpx),
            child: CupertinoButton(

                padding:EdgeInsets.all(0),
                color: Color(0xff999999),
                borderRadius:BorderRadius.circular(60.rpx),
                child: Text('配套升级',style: TextStyle(color: Colors.white,fontSize: 30.rpx),),
                onPressed: () {

                }
            ),
          ),
        ),
        Expanded(
          flex:1,
          child: Container(
            margin: EdgeInsets.all(20.rpx),
            child: CupertinoButton(
                padding:EdgeInsets.all(0),
                color: Theme.of(context).accentColor,
                borderRadius:BorderRadius.circular(60.rpx),
                child: Text('开始按摩',style: TextStyle(color: Colors.white,fontSize: 30.rpx),),
                onPressed: () {

                }
            ),
          ),
        ),
      ],
    ),
  );
    //可接单
    case 2:return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            flex:1,
            child: Container(
              margin: EdgeInsets.all(20.rpx),
              child: CupertinoButton(

                  padding:EdgeInsets.all(0),
                  color: Color(0xff999999),
                  borderRadius:BorderRadius.circular(60.rpx),
                  child: Text('拒绝接单',style: TextStyle(color: Colors.white,fontSize: 30.rpx),),
                  onPressed: () {

                  }
              ),
            ),
          ),
          Expanded(
            flex:1,
            child: Container(
              margin: EdgeInsets.all(20.rpx),
              child: CupertinoButton(
                  padding:EdgeInsets.all(0),
                  color: Theme.of(context).accentColor,
                  borderRadius:BorderRadius.circular(60.rpx),
                  child: Text('确认接单',style: TextStyle(color: Colors.white,fontSize: 30.rpx),),
                  onPressed: () {

                  }
              ),
            ),
          ),
        ],
      ),
    );
    //已完成
    case 3: return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            flex:1,
            child: Container(
                margin: EdgeInsets.all(20.rpx),
                child: Container(
                  margin: EdgeInsets.all(20.rpx),
                  child: CupertinoButton(
                      padding:EdgeInsets.all(0),
                      color: Theme.of(context).accentColor,
                      borderRadius:BorderRadius.circular(60.rpx),
                      child: Text('填写备注',style: TextStyle(color: Colors.white,fontSize: 30.rpx),),
                      onPressed: () {
                        Navigator.of(context).pushNamed(RouteName.complainForm,arguments: ['填写备注',2]);
                      }
                  ),
                )
            ),
          ),
          Expanded(
            flex:1,
            child: Container(
              margin: EdgeInsets.all(20.rpx),
              child: CupertinoButton(
                  padding:EdgeInsets.all(0),
                  color: Theme.of(context).accentColor,
                  borderRadius:BorderRadius.circular(60.rpx),
                  child: Text(S.of(context).contact,style: TextStyle(color: Colors.white,fontSize: 30.rpx),),
                  onPressed: () {

                  }
              ),
            ),
          ),
        ],
      ),
    );
    //服务中   取消中
    default: return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            flex:1,
            child: Container(
                margin: EdgeInsets.all(20.rpx),
                child: Container()
            ),
          ),
          Expanded(
            flex:1,
            child: Container(
              margin: EdgeInsets.all(20.rpx),
              child: CupertinoButton(
                  padding:EdgeInsets.all(0),
                  color: Theme.of(context).accentColor,
                  borderRadius:BorderRadius.circular(60.rpx),
                  child: Text(S.of(context).contact,style: TextStyle(color: Colors.white,fontSize: 30.rpx),),
                  onPressed: () {

                  }
              ),
            ),
          ),
        ],
      ),
    );
  }
}