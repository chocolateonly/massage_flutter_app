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
import 'package:massageflutterapp/ui/pages/mine/workplace/get_service_order_button.dart';
class WorkPlatformPage extends StatefulWidget {

  @override
  _WorkPlatformPageState createState() => _WorkPlatformPageState();
}

class _WorkPlatformPageState extends State<WorkPlatformPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(S.of(context).workPlatform),
      ),
      body: ProviderWidget2<OrderDetailModel,MyOrderListModel>(
          onModelReady: (orderDetailModel,model){
            //初始化状态是调用页面初始数据
            orderDetailModel.loadData();
            model.initData();
          },
          builder: (context,orderDetailModel,model,child){
            return SmartRefresher(
              controller: model.refreshController,
              header: RefreshHeader(),
              footer: RefresherFooter(),
              onRefresh: model.refresh,
              onLoading: model.loadMore,
              enablePullUp: true,
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: 20.rpx),
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 425.rpx,
                        child: Stack(
                          children: <Widget>[
                            Container(
                              height:300.rpx,
                              decoration:BoxDecoration(
                                  color:Theme.of(context).accentColor //背景颜色 Theme.of(context).accentColor
                              ),
                            ),
                            //头像 姓名
                            Container(
                              padding:EdgeInsets.symmetric(horizontal:30.rpx),
                              height: 200.rpx,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(54.rpx),
                                      child: Image.network(ImageHelper.img,width: 108.rpx,height: 108.rpx,)
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        constraints: BoxConstraints(maxWidth: 200.rpx),
                                        child: Text(orderDetailModel.orderDetail.status,style:TextStyle(color: Colors.white,fontSize: 34.rpx),overflow: TextOverflow.ellipsis,),
                                      ),
                                      SizedBox(width:10.rpx),
                                      //等级
                                      Container(
                                        padding: EdgeInsets.symmetric(vertical:6.rpx,horizontal: 10.rpx),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20.rpx),
                                            border: Border.all(color: Colors.white)
                                        ),
                                        child: Row(
                                          children: <Widget>[
                                            Image.asset(ImageHelper.wrapAssets('massagist_level1.png'),width: 24.rpx,height: 19.rpx,),
                                            SizedBox(width:10.rpx),
                                            Text('LV 1',style:TextStyle(color:Colors.white,fontSize: 24.rpx ),overflow: TextOverflow.ellipsis,),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top:225.rpx,
                              left:20.rpx,
                              right:20.rpx,
                              child:           Container(
                                width:double.maxFinite,
                                child: Card(
                                    shape:  RoundedRectangleBorder(borderRadius:BorderRadius.circular(10.rpx)),
                                    child:Container(
                                      padding:EdgeInsets.symmetric(horizontal:20.rpx,vertical: 40.rpx),
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: <Widget>[
                                              gridItem('接单大厅','w_1.png',0),
                                              gridItem('我的库存','w_2.png',1),
                                              gridItem('身体状况','w_3.png',2),
                                              gridItem('个人设置','w_4.png',3),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                      //待接单标题
                      Container(
                        padding:  EdgeInsets.only(top:20.rpx,left:20.rpx,right:20.rpx),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('待服务订单',style: TextStyle(color:Color(0xff333333),fontSize: 34.rpx),overflow: TextOverflow.ellipsis),
                            InkWell(
                              onTap: (){
                                Navigator.of(context).pushNamed(RouteName.serviceOrder,arguments: [0]);
                              },
                              child: Row(
                                children: <Widget>[
                                  Text('查看全部',style: TextStyle(color:Color(0xff999999),fontSize: 26.rpx),overflow: TextOverflow.ellipsis),
                                  SizedBox(width: 10.rpx,),
                                  Image.asset(ImageHelper.wrapAssets('w_arrow_r.png'),width:22.rpx,height: 22.rpx,)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: model.list.length,
                        itemBuilder: (context, index) {
                          return ItemOrder(model.list[index]);
                        }),
                    ],
                  ),
                ),
            );
          },
          model1:OrderDetailModel(),
          model2:MyOrderListModel(),
      )
    );
  }
  Widget gridItem(text, src, index) {
    return InkWell(
      onTap: () {
        switch(index){
          case 1:Navigator.of(context).pushNamed(RouteName.myWarehouse);
          break;
          case 2:Navigator.of(context).pushNamed(RouteName.bodyStatusInfo);
          break;
          case 3:Navigator.of(context).pushNamed(RouteName.personalSetting);
          break;
          default: Navigator.of(context).pushNamed(RouteName.serviceOrderRoom);
        }
        //Navigator.of(context).pushNamed(RouteName.myOrderList, arguments: [index]);
      },
      child: Column(
        children: <Widget>[
          Image.asset(
            ImageHelper.wrapAssets(src),
            width: 25.px,
            height: 25.px,
          ),
          SizedBox(height: 6.px),
          Container(
              width: 140.rpx,
              child: Text(text,
                  style: TextStyle(color:Color(0xff6D3E0B), fontSize: 14.px), maxLines: 1, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center)),
        ],
      ),
    );
  }
}


class ItemOrder extends StatefulWidget {
  var item;
  ItemOrder(this.item);
  @override
  _ItemOrderState createState() => _ItemOrderState();
}

class _ItemOrderState extends State<ItemOrder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.all(20.rpx),
      margin:EdgeInsets.only(top: 20.rpx,left:20.rpx,right:20.rpx),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.rpx),
      ),
      child: InkWell(
        onTap: (){
          Navigator.of(context).pushNamed(RouteName.serviceOrderDetail,arguments: ['1']);
        },
        child: Column(
          children: <Widget>[
            Container(
              padding:EdgeInsets.symmetric(vertical: 20.rpx),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Color(0xffeeeeee)))
              ),
              child:Row(
                children: <Widget>[
                  Text(S.of(context).orderNumber,style:TextStyle(color: Color(0xff666666),fontSize: 24.rpx)),
                  SizedBox(width:10.rpx),
                  Expanded(child: Text('5656',style:TextStyle(color: Color(0xff666666),fontSize: 24.rpx),overflow: TextOverflow.ellipsis,)),
                ],
              ),
            ),
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
            getServiceOrderButton(context,widget.item,2)
          ],
        ),
      ),
    );
  }
}
