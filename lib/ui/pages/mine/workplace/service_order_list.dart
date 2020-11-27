import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/provider/provider_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:massageflutterapp/view_model/my_order_list_model.dart';
import 'package:massageflutterapp/view_model/refresh_helper.dart';

import 'package:massageflutterapp/ui/pages/mine/work_platform.dart';
class ServiceOrderPage extends StatefulWidget {
  var type=0;//订单状态

  ServiceOrderPage(this.type);

  @override
  _ServiceOrderPageState createState() => _ServiceOrderPageState();
}

class _ServiceOrderPageState extends State<ServiceOrderPage> {

  @override
  Widget build(BuildContext context) {
    var orderStatus=[
      S.of(context).all,
      S.of(context).orderStatus9,
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


