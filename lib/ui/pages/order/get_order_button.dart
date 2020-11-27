import 'package:flutter/material.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/ui/widgets/button/order_button.dart';
import 'package:massageflutterapp/config/router_manager.dart';
import 'package:massageflutterapp/ui/widgets/dialog/dialog_helper.dart';
import 'package:url_launcher/url_launcher.dart';
List getOrderButton(BuildContext context,item,model,type){
  var button=[];
  onComplain(){
    Navigator.of(context).pushNamed(RouteName.complainForm,arguments: [S.of(context).complain,1]);
  }
  onContact(){
    launch("tel://18727275857");
  }
  switch(3){
  //进行中
    case 1:button.addAll(
        [
          OrderButton(title:S.of(context).complain,onPressed:(){
            onComplain();
          },isOutLineButton:true),
          OrderButton(title:S.of(context).finish,onPressed:(){
            //fixme:跳转到完成的页面
            Navigator.of(context).pushNamed(RouteName.tab);
          },isOutLineButton:false),
        ]
    );
    break;
  //已完成
    case 2:button.addAll(
        [
          OrderButton(title:S.of(context).complain,onPressed:(){
            onComplain();
          },isOutLineButton:true),
          OrderButton(title:S.of(context).goComment,onPressed:(){
               Navigator.of(context).pushNamed(RouteName.orderComment);
          },isOutLineButton:false),
        ]
    );
    break;
  //取消中
    case 3:button.addAll(
        [
          OrderButton(title:S.of(context).showDetail,onPressed:(){
            Navigator.of(context).pushNamed(RouteName.complainForm,arguments: [S.of(context).complain,1]);
            //Navigator.of(context).pushNamed(RouteName.orderDetail,arguments: ['id']);
          },isOutLineButton:true),
          OrderButton(title:S.of(context).contact,onPressed:(){
            onContact();
          },isOutLineButton:false),
        ]
    );
    break;
  //待服务
    default:button.addAll(
        [
          OrderButton(title:S.of(context).cancelAppointment,onPressed:(){
            Navigator.of(context).pushNamed(RouteName.orderCancel);
          },isOutLineButton:true),
          OrderButton(title:S.of(context).contact,
              onPressed:(){
                onContact();
              },
              isOutLineButton:false),
        ]
    );
  }
  return button;
}