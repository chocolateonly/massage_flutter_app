import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:massageflutterapp/config/resouce_manager.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/provider/provider_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:massageflutterapp/view_model/my_order_list_model.dart';
import 'package:massageflutterapp/view_model/refresh_helper.dart';
import '../../widgets/loading/loading_wrap.dart';
import 'package:massageflutterapp/utils/size_fit.dart';
import 'package:massageflutterapp/ui/widgets/button/order_button.dart';
class MyOrderListPage extends StatefulWidget {
  var type=0;//订单状态

  MyOrderListPage(this.type);

  @override
  _MyOrderListPageState createState() => _MyOrderListPageState();
}

class _MyOrderListPageState extends State<MyOrderListPage> {

  @override
  Widget build(BuildContext context) {
    var orderStatus=[
      S.of(context).orderStatus1,
      S.of(context).orderStatus2,
      S.of(context).orderStatus3,
      S.of(context).orderStatus4,
      S.of(context).orderStatus5,
      S.of(context).orderStatus6,
      S.of(context).orderStatus7,
    ];

    return DefaultTabController(
      length: orderStatus.length,
      initialIndex: widget.type,
      child: Scaffold(
        backgroundColor: Color(0xfff5f5f5),
        appBar: AppBar(
          centerTitle: true,
          title: Text(S.of(context).myOrder),
          bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              isScrollable: true,
              tabs: List.generate(orderStatus.length, (index) => Tab(text: orderStatus[index]))),
        ),
        body: TabBarView(children: List.generate(orderStatus.length, (index) => OrderListContent(index))),
      ),
    );
  }
}

class OrderListContent extends StatefulWidget {
  var index;

  OrderListContent(this.index);

  @override
  _OrderListContentState createState() => _OrderListContentState();
}

class _OrderListContentState extends State<OrderListContent> {

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<MyOrderListModel>(
      onModelReady: (model) {
        model.setStatus(widget.index);
        model.initData();
      },
      builder:(context,model,child){
        LoadingWrap.ctx=context; //需要加载时，全局加载context配置
        return SmartRefresher(
        controller: model.refreshController,
            header: RefreshHeader(),
            footer: RefresherFooter(),
            onRefresh: model.refresh,
            onLoading: model.loadMore,
            enablePullUp: true,
            child: ListView.builder(
                itemCount: model.list.length,
                itemBuilder: (context, index) {
                  return ItemOrder(model.list[index]);
                }));
      },
      model:MyOrderListModel(),
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
      margin: EdgeInsets.only(left: 20.rpx,top:20.rpx,right:20.rpx),
      child: Container(
        padding:EdgeInsets.all(20.rpx),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.rpx)
          ),
          child: Column(
             children: <Widget>[
               Container(
                 child: Row(
                   children: <Widget>[
                     Expanded(
                       child: Row(
                         children: <Widget>[
                           Text(S.of(context).orderNumber,style:TextStyle(color: Color(0xff666666),fontSize: 24.rpx)),
                           Expanded(child: Text(widget.item.id,style:TextStyle(color: Color(0xff666666),fontSize: 24.rpx),overflow: TextOverflow.ellipsis,)),
                         ],
                       ),
                     ),
                     Chip(
                       label: Text(widget.item.name,style: TextStyle(color: Theme.of(context).accentColor,fontSize: 24.rpx),),
                       backgroundColor:Color(0xffFAF1EA),
                     )
                   ],
                 ),
               ),
               Container(
                 height: 150.rpx,
                 padding:EdgeInsets.symmetric(vertical: 20.rpx),
                 decoration: BoxDecoration(
                     border: Border(bottom: BorderSide(color: Color(0xffeeeeee)),top:BorderSide(color: Color(0xffeeeeee)))
                 ),
                 child: Row(
                   children: <Widget>[
                     Container(
                       padding: EdgeInsets.only(right: 20.rpx),
                       decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3)),
                       child: CachedNetworkImage(
                              height: 140.rpx,
                              width: 140.rpx,
                              imageUrl: ImageHelper.wrapUrl(widget.item.image),
                              placeholder: (context, url) => Center(child: CupertinoActivityIndicator()),
                              errorWidget: (context, url, error) => Icon(Icons.error))
                     ),
                     Expanded(
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: <Widget>[
                           Text(widget.item.name,style: TextStyle(color:Color(0xff333333),fontSize: 30.rpx),textAlign: TextAlign.left,),
                           Text(widget.item.name+'挥洒法华寺东方航空史蒂芬霍金看到的非官方定',style: TextStyle(color:Color(0xff999999),fontSize: 24.rpx),textAlign: TextAlign.left,overflow: TextOverflow.ellipsis,),
                           Text('x1',style: TextStyle(color:Color(0xff999999),fontSize: 24.rpx),textAlign: TextAlign.left,),
                         ],
                       ),
                     )
                   ],
                 ),
               ),
               SizedBox(height: 20.rpx,),
               Row(
                 children: <Widget>[
                   Expanded(
                     child: Padding(
                       padding: EdgeInsets.symmetric(vertical: 20.rpx),
                       child: Row(
                         children: <Widget>[
                           Text(S.of(context).priceUnit,style:TextStyle(color: Color(0xffEC1C24),fontSize: 26.rpx)),
                           Text('2000.5',style:TextStyle(color: Color(0xffEC1C24),fontSize: 38.rpx )),
                           SizedBox(width: 10.rpx,),
                           Text(S.of(context).priceUnit,style:TextStyle(color: Color(0xff999999),fontSize: 26.rpx,
                             decoration: TextDecoration.lineThrough,
                             decorationColor: const Color(0xff999999),),),
                           Text('2000.5',style:TextStyle(color: Color(0xff999999),fontSize: 26.rpx,
                             decoration: TextDecoration.lineThrough,
                             decorationColor: const Color(0xff999999),)),
                         ],
                       ),
                     ),
                   ),
                   ...getOrderButton(context,widget.item),
                 ],
               )
             ],
          )
      ),
    );
  }
}

List getOrderButton(BuildContext context,item){
  var button=[];
  switch(item.id){
     default:button.addAll(
       [
         OrderButton(title:S.of(context).contact,onPressed:(){},isOutLineButton:true),
         OrderButton(title:S.of(context).goPay,onPressed:(){},isOutLineButton:false),
       ]
     );
  }
  return button;
}
