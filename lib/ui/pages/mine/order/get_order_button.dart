import 'package:flutter/material.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/ui/widgets/button/order_button.dart';
import 'package:massageflutterapp/config/router_manager.dart';
import 'package:massageflutterapp/utils/size_fit.dart';
import 'package:massageflutterapp/ui/widgets/button/theme_button.dart';
List getOrderButton(BuildContext context,item,model,type){
  var button=[];
  switch(3){
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
    case 3:button.addAll(
        [
          OrderButton(title:S.of(context).cancelOrder,onPressed:(){},isOutLineButton:true),
          OrderButton(title:S.of(context).makeAnAppointment,onPressed:(){
            Navigator.of(context).pushNamed(RouteName.makeAnAppointment,arguments: [item.id]);
          },isOutLineButton:false),
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
            showDialog(
                context:context,
                barrierDismissible:true,//点击遮罩是否关闭
                builder: (context) {
                  return Dialog(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.rpx))
                      ),
                      child:Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.rpx),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,//自动撑高
                          children: <Widget>[
                            Container(
                              width:double.maxFinite,
                              padding: EdgeInsets.all(40.rpx),
                              decoration: BoxDecoration(
                                  color: Theme.of(context).accentColor
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.check_circle,color: Theme.of(context).accentColor,size: 50.rpx,),
                                  Text(S.of(context).tipTile,style: TextStyle(color: Colors.white,fontSize: 30.rpx),)
                                ],
                              ) ,
                            ),
                            Container(
                              padding: EdgeInsets.all(40.rpx),
                              child:  Text(S.of(context).cancelOrderTip,
                                style: TextStyle(color: Color(0xff4d4d4d),fontSize: 32.rpx),textAlign: TextAlign.center,),
                            ),
                            Container(
                              width: 480.rpx,
                              child: ThemeButton(
                                title:S.of(context).confirm,
                                onPressed: (){
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                          ],
                        ),
                      )
                  );
                }
            );

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