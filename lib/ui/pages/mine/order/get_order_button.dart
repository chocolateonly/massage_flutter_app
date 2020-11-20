import 'package:flutter/material.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/ui/widgets/button/order_button.dart';
import 'package:massageflutterapp/config/router_manager.dart';
import 'package:massageflutterapp/ui/widgets/dialog/dialog_helper.dart';
List getOrderButton(BuildContext context,item,model,type){
  var button=[];
  switch(item.id){
  //待审核
    case 1:button.addAll(
        [
          OrderButton(title:S.of(context).cancelOrder,onPressed:(){},isOutLineButton:true),
          OrderButton(title:S.of(context).contact,onPressed:(){},isOutLineButton:false),
        ]
    );
    break;
  //已驳回
    case 1:button.addAll(
        [
          OrderButton(title:S.of(context).contact,onPressed:(){},isOutLineButton:true),
          OrderButton(title:S.of(context).buyAgain,onPressed:(){},isOutLineButton:false),
        ]
    );
    break;
  //已购买
    case 1:button.addAll(
        [
          OrderButton(title:S.of(context).cancelOrder,onPressed:(){},isOutLineButton:true),
          OrderButton(title:S.of(context).makeAnAppointment,onPressed:(){},isOutLineButton:false),
        ]
    );
    break;
  //已完成
    case 2:button.addAll(
        [
          OrderButton(title:S.of(context).contact,onPressed:(){},isOutLineButton:true),
          OrderButton(title:S.of(context).buyAgain,onPressed:(){},isOutLineButton:false),
        ]
    );
    break;
  //取消中
    case 3:button.addAll(
        [
          OrderButton(title:S.of(context).contact,onPressed:(){},isOutLineButton:true),
          OrderButton(title:S.of(context).buyAgain,onPressed:(){},isOutLineButton:false),
        ]
    );
    break;
  //待付款
    default:button.addAll(
        [
          OrderButton(title:S.of(context).contact,onPressed:(){
          //模拟取消订单

            DialogHelper.showLoginDialog(context, S.of(context).tipTile,S.of(context).cancelOrderTip, S.of(context).confirm, S.of(context).cancel, () {
              Navigator.of(context).pop(false);
              //todo:删除订单
              //model
            });
          },isOutLineButton:true),
          OrderButton(title:S.of(context).goPay,
              onPressed:(){
                //fixme:上传支付凭证
                Navigator.of(context).pushNamed(RouteName.orderDetail,arguments: [item.id]);
              },
              isOutLineButton:false),
        ]
    );
  }
  return button;
}