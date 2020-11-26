import 'package:flutter/material.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/ui/widgets/button/order_button.dart';
import 'package:massageflutterapp/config/router_manager.dart';
import 'package:massageflutterapp/ui/widgets/dialog/dialog_helper.dart';
import 'package:url_launcher/url_launcher.dart';
List getOrderButton(BuildContext context,item,model,type){
  var button=[];
  switch(3){
  //进行中
    case 1:button.addAll(
        [
          OrderButton(title:'投诉举报',onPressed:(){
            Navigator.of(context).pushNamed(RouteName.complainForm,arguments: ['投诉举报',1]);
          },isOutLineButton:true),
          OrderButton(title:'确认完成',onPressed:(){

          },isOutLineButton:false),
        ]
    );
    break;
  //已完成
    case 2:button.addAll(
        [
          OrderButton(title:'投诉举报',onPressed:(){},isOutLineButton:true),
          OrderButton(title:'去评价',onPressed:(){
               Navigator.of(context).pushNamed(RouteName.orderComment);
          },isOutLineButton:false),
        ]
    );
    break;
  //取消中
    case 3:button.addAll(
        [
          OrderButton(title:'查看详情',onPressed:(){},isOutLineButton:true),
          OrderButton(title:'联系客服',onPressed:(){},isOutLineButton:false),
        ]
    );
    break;
  //待服务
    default:button.addAll(
        [
          OrderButton(title:'取消预约',onPressed:(){
            Navigator.of(context).pushNamed(RouteName.orderCancel);
          },isOutLineButton:true),
          OrderButton(title:S.of(context).contact,
              onPressed:(){
                launch("tel://18727275857");
              },
              isOutLineButton:false),
        ]
    );
  }
  return button;
}