import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/utils/size_fit.dart';
import 'package:massageflutterapp/ui/pages/mine/work_platform.dart';
import 'package:massageflutterapp/config/resouce_manager.dart';
class ServiceOrderDetailPage extends StatefulWidget {
  var id;
  var detail;
  ServiceOrderDetailPage(this.id);
  @override
  _ServiceOrderDetailPageState createState() => _ServiceOrderDetailPageState();
}

class _ServiceOrderDetailPageState extends State<ServiceOrderDetailPage> {

  var status=0;
  getProgress(status){
    var list=[];
    for(var i=0;i<status.length;i++){
      list.add(
          Expanded(
            flex: 1,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top:28.rpx,
                  child: Container(
                    width:double.maxFinite,
                    height: 6.rpx,
                    color: i<=0?Theme.of(context).accentColor:Color(0xffe2e2e2),
                  ),
                ),
                Container(
                  width: double.maxFinite,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20.rpx),
                        width:20.rpx,
                        height: 20.rpx,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.rpx),
                            color: i<=0?Theme.of(context).accentColor:Color(0xffe2e2e2)
                        ),
                      ),
                      Text(status[i],style: TextStyle(color: i<=0?Theme.of(context).accentColor:Color(0xffe2e2e2),fontSize: 30.rpx),overflow: TextOverflow.ellipsis,)
                    ],
                  ),
                )
              ],
            ),
          )
      );
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    var serviceOrderStatus=[
      S.of(context).orderStatus8,
      S.of(context).orderStatus9,
      S.of(context).orderStatus6
    ];
    return Scaffold(
        appBar: AppBar(
        centerTitle: true,
        title: Text(S.of(context).detail),
    ),
      body: SingleChildScrollView(
        child:Container(
          padding:  EdgeInsets.all(20.rpx),
          margin:EdgeInsets.only(top: 20.rpx,left:20.rpx,right:20.rpx),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.rpx),
          ),
          child: Column(
            children: <Widget>[
//              订单号
              Container(
                padding:EdgeInsets.symmetric(vertical: 20.rpx),
                decoration: BoxDecoration(

                ),
                child:Row(
                  children: <Widget>[
                    Text(S.of(context).orderNumber,style:TextStyle(color: Color(0xff666666),fontSize: 24.rpx)),
                    SizedBox(width:10.rpx),
                    Expanded(child: Text('5656',style:TextStyle(color: Color(0xff666666),fontSize: 24.rpx),overflow: TextOverflow.ellipsis,)),
                  ],
                ),
              ),
//进度显示
             Container(
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: <Widget>[
                  ...getProgress(serviceOrderStatus)
                 ],
               ),
             ),
        (status==0?Container(
          width: double.maxFinite,
          child: Column(
            children: <Widget>[
              Container(
                width: double.maxFinite,
                padding: EdgeInsets.all(20.rpx),
                margin: EdgeInsets.symmetric(vertical: 20.rpx),
                decoration: BoxDecoration(
                    color: Color(0xfff3f3f3)
                ),
                child: Text('${S.of(context).totalTime}：12：33:33',style: TextStyle(color: Color(0xff111111),fontSize: 30.rpx),),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(ImageHelper.wrapAssets('s_o_success.png'),width:208.rpx,height: 208.rpx,),
                  Container(
                      padding: EdgeInsets.only(top:20.rpx,bottom: 40.rpx),
                      child: Text(S.of(context).orderFinished,style: TextStyle(color: Theme.of(context).accentColor,fontSize: 34.rpx),)
                  ),
                  Text(S.of(context).serviceOrderTip,style: TextStyle(color: Color(0xff666666),fontSize: 26.rpx),),
                ],
              )
            ],
          ),
        ):
          ItemOrder({})
        )


            ],
          ),
        ),
      ),
    );
  }
}
