import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:massageflutterapp/config/resouce_manager.dart';
import 'package:massageflutterapp/utils/size_fit.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/provider/provider_widget.dart';
import '../../../../view_model/order_detail_model.dart';
import 'package:massageflutterapp/ui/pages/mine/order/get_order_button.dart';
class OrderDetailPage extends StatefulWidget {
  var id;

  OrderDetailPage(this.id);

  @override
  _OrderDetailPageState createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(S.of(context).orderDetail),
      ),
      body: ProviderWidget(
        onModelReady: (orderDetailModel){
          //初始化状态是调用页面初始数据
          orderDetailModel.loadData();
        },
        builder: (context,orderDetailModel,child){
          return NotificationListener(  //页面有输入框时的失焦操作
              onNotification: (ScrollNotification notification) {
                FocusScope.of(context).requestFocus(new FocusNode());
                return true;
              },
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
//                  状态 地址
                  Container(
                    height: 300.rpx,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          height: 200.rpx,
                          decoration:BoxDecoration(
                              color:Theme.of(context).accentColor //背景颜色 Theme.of(context).accentColor
                          ),
                        ),
                        Container(
                          padding:EdgeInsets.symmetric(horizontal:30.rpx),
                          child: Row(
                            children: <Widget>[
                              Image.asset(ImageHelper.wrapAssets('icon_time.png'),width: 40.rpx,height: 40.rpx,),
                              SizedBox(width:10.rpx),
                              Text(orderDetailModel.orderDetail.status,style:TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                        Positioned(
                          top:100.rpx,
                          left:20.rpx,
                          right:20.rpx,
                          child:  Container(
                            width:double.maxFinite,
                            height: 200.rpx,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.rpx),
                            ),
                            child:Padding(
                              padding:  EdgeInsets.all(20.rpx),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      SizedBox(width:43.rpx),
                                      ConstrainedBox(
                                          constraints:BoxConstraints(maxWidth: 200.rpx),
                                          child: Text('上端上端:',style: TextStyle(color: Color(0xff333333),fontSize: 34.rpx),overflow: TextOverflow.ellipsis,)),
                                      SizedBox(width:10.rpx),
                                      Expanded(child: Text('234245432',style: TextStyle(color: Color(0xff666666),fontSize: 34.rpx),overflow: TextOverflow.ellipsis,))
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Image.asset(ImageHelper.wrapAssets('icon_address.png'),width: 33.rpx,height: 36.rpx,),
                                      SizedBox(width:10.rpx),
                                      Expanded(child: Text('湖北省襄阳市樊城区万达小区',style: TextStyle(color: Color(0xff333333),fontSize: 30.rpx),overflow: TextOverflow.ellipsis,))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
//                  商品详情
              Container(
                padding:  EdgeInsets.all(20.rpx),
                margin:EdgeInsets.only(top: 20.rpx,left:20.rpx,right:20.rpx),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.rpx),
                ),
                child: Column(
                  children: <Widget>[
//                    商品
                    Row(
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.only(right: 20.rpx),
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
                              Text('3天经期全面调理 拷贝',style: TextStyle(color:Color(0xff333333),fontSize: 30.rpx),textAlign: TextAlign.left,overflow: TextOverflow.ellipsis,),
                              Chip(
                                label: Text(S.of(context).surplusComboOrder(8)),
                                labelStyle: TextStyle(color: Theme.of(context).accentColor,fontSize: 24.rpx),
                                backgroundColor: Color(0xffFAF1EA),
                              )
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
                          Text(S.of(context).serviceTime+":",style: TextStyle(color:Color(0xff666666),fontSize: 26.rpx)),
                          Text(S.of(context).serviceTime,style: TextStyle(color:Color(0xff333333),fontSize: 26.rpx)),
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
                            Text(S.of(context).massagist+":",style: TextStyle(color:Color(0xff666666),fontSize: 26.rpx)),
                            Text(S.of(context).massagist,style: TextStyle(color:Color(0xff333333),fontSize: 26.rpx)),
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
                            Text(S.of(context).remark+":",style: TextStyle(color:Color(0xff666666),fontSize: 26.rpx)),
                            Expanded(child: Text('备注备注备注备注备注备注备注备注备注备注备注备注备注备注备注备注备注备注备注备注',style: TextStyle(color:Color(0xff333333),fontSize: 26.rpx),maxLines: null,)),
                          ]
                      ),
                    ),
                  ],
                ),
              ),
                  Container(
                    padding:  EdgeInsets.all(20.rpx),
                    margin:EdgeInsets.only(top: 20.rpx,left:20.rpx,right:20.rpx),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.rpx),
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding:EdgeInsets.symmetric(vertical: 20.rpx),
                          decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(color: Color(0xffeeeeee)))
                          ),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(S.of(context).orderNum+":",style: TextStyle(color:Color(0xff666666),fontSize: 26.rpx)),
                                Text(S.of(context).orderNum,style: TextStyle(color:Color(0xff333333),fontSize: 26.rpx)),
                              ]
                          ),
                        ),
                        Container(
                          padding:EdgeInsets.symmetric(vertical: 20.rpx),
                          decoration: BoxDecoration(
                            //border: Border(bottom: BorderSide(color: Color(0xffeeeeee)))
                          ),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(S.of(context).orderTime+":",style: TextStyle(color:Color(0xff666666),fontSize: 26.rpx)),
                                Text(S.of(context).orderTime,style: TextStyle(color:Color(0xff333333),fontSize: 26.rpx)),
                              ]
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding:EdgeInsets.all(20.rpx),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        InkWell(
                          onTap:(){
                            //todo:联系客服
                          },
                          child:Row(
                            children: <Widget>[
                              Image.asset(ImageHelper.wrapAssets('icon_contact.png'),width: 61.rpx,height: 51.rpx,),
                              SizedBox(width:10.rpx),
                              Text(S.of(context).contact,style: TextStyle(color: Color(0xff888888),fontSize: 32.rpx),overflow: TextOverflow.ellipsis,)
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            children: <Widget>[
                              ...getOrderButton(context,orderDetailModel.orderDetail,orderDetailModel,'from_detail'),
                            ],
                          ),
                        )

                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
        model:OrderDetailModel()
      ),
    );
  }
}
