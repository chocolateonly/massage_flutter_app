import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/utils/size_fit.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:massageflutterapp/config/resouce_manager.dart';

import 'package:massageflutterapp/ui/pages/mine/workplace/get_service_order_button.dart';
class ServiceOrderDetailPage extends StatefulWidget {
  var id;
  var detail;
  ServiceOrderDetailPage(this.id);
  @override
  _ServiceOrderDetailPageState createState() => _ServiceOrderDetailPageState();
}

class _ServiceOrderDetailPageState extends State<ServiceOrderDetailPage> {

  var serviceOrderStatus=['待服务','服务中','已完成'];
  var status=2;
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
    return Scaffold(
        appBar: AppBar(
        centerTitle: true,
        title: Text('服务单详情'),
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
        (status==2?Container(
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
                child: Text('总时长：12：33:33',style: TextStyle(color: Color(0xff111111),fontSize: 30.rpx),),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(ImageHelper.wrapAssets('s_o_success.png'),width:208.rpx,height: 208.rpx,),
                  Container(
                      padding: EdgeInsets.only(top:20.rpx,bottom: 40.rpx),
                      child: Text('订单已完成',style: TextStyle(color: Theme.of(context).accentColor,fontSize: 34.rpx),)
                  ),
                  Text('温馨提示：按摩师48h内需要把钱送达财务确认哦~',style: TextStyle(color: Color(0xff666666),fontSize: 26.rpx),),
                ],
              )
            ],
          ),
        ):
        Container(
          child: Column(
            children: <Widget>[
              //                    商品
              Row(
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.only(right: 20.rpx,top:20.rpx,bottom: 20.rpx),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3)),
                      child: CachedNetworkImage(
                          height: 150.rpx,
                          width: 150.rpx,
                          imageUrl: ImageHelper.wrapUrl(ImageHelper.img),
                          placeholder: (context, url) => Center(child: CupertinoActivityIndicator()),
                          errorWidget: (context, url, error) => Icon(Icons.error))
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('3天经期全面调理',style: TextStyle(color:Color(0xff333333),fontSize: 30.rpx),textAlign: TextAlign.left,),
                        Text('挥洒法华寺东方航空史蒂芬霍金看到的非官方定',style: TextStyle(color:Color(0xff999999),fontSize: 24.rpx),textAlign: TextAlign.left,overflow: TextOverflow.ellipsis,),
                        Text('x1',style: TextStyle(color:Color(0xff999999),fontSize: 24.rpx),textAlign: TextAlign.left,),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                padding:EdgeInsets.symmetric(vertical: 20.rpx),
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Color(0xffeeeeee)))
                ),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text("预约信息",style: TextStyle(color:Color(0xff666666),fontSize: 26.rpx)),
                      SizedBox(width:10.rpx),
                      Text(S.of(context).serviceTime,style: TextStyle(color:Color(0xff333333),fontSize: 26.rpx),overflow: TextOverflow.ellipsis,),
                    ]
                ),
              ),
              Container(
                padding:EdgeInsets.symmetric(vertical: 20.rpx),
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Color(0xffeeeeee)))
                ),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text("预约时间",style: TextStyle(color:Color(0xff666666),fontSize: 26.rpx)),
                      SizedBox(width:10.rpx),
                      Text('2020-11-1 1:00-2020-11-1 1:00',style: TextStyle(color:Color(0xff333333),fontSize: 26.rpx),overflow: TextOverflow.ellipsis),
                    ]
                ),
              ),
              Container(
                padding:EdgeInsets.symmetric(vertical: 20.rpx),
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Color(0xffeeeeee)))
                ),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text("预约佣金",style: TextStyle(color:Color(0xff666666),fontSize: 26.rpx)),
                      SizedBox(width:10.rpx),
                      Text(S.of(context).priceUnit+'200.00',style: TextStyle(color:Color(0xff333333),fontSize: 26.rpx),overflow: TextOverflow.ellipsis),
                    ]
                ),
              ),
              Container(
                padding:EdgeInsets.symmetric(vertical: 20.rpx),
                decoration: BoxDecoration(
                  //border: Border(bottom: BorderSide(color: Color(0xffeeeeee)))
                ),
                child: Row(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("上门地址",style: TextStyle(color:Color(0xff666666),fontSize: 26.rpx)),
                      SizedBox(width:10.rpx),
                      Expanded(child: Text('备注备注备注备注备注备注备注备注备注备注备注备注备注备注备注备注备注备注备注备注',style: TextStyle(color:Color(0xff333333),fontSize: 26.rpx),maxLines: null,)),
                    ]
                ),
              ),
              //操作按钮
              getServiceOrderButton(context,widget.detail,1)
            ],
          ),
        )
        )


            ],
          ),
        ),
      ),
    );
  }
}
