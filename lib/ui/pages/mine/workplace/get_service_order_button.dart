import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:massageflutterapp/utils/size_fit.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/config/router_manager.dart';
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
                child: Text(S.of(context).upComboLevel,style: TextStyle(color: Colors.white,fontSize: 30.rpx),),
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
                child: Text(S.of(context).startMassage,style: TextStyle(color: Colors.white,fontSize: 30.rpx),),
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
                  child: Text(S.of(context).refuseOrder,style: TextStyle(color: Colors.white,fontSize: 30.rpx),),
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
                  child: Text(S.of(context).receiveOrder,style: TextStyle(color: Colors.white,fontSize: 30.rpx),),
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
                      child: Text(S.of(context).inputRemark,style: TextStyle(color: Colors.white,fontSize: 30.rpx),),
                      onPressed: () {
                        Navigator.of(context).pushNamed(RouteName.complainForm,arguments: [S.of(context).inputRemark,2]);
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