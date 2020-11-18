import 'package:flutter/material.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/provider/provider_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:massageflutterapp/view_model/my_order_list_model.dart';
import 'package:massageflutterapp/view_model/refresh_helper.dart';
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
    ];

    return DefaultTabController(
      length: orderStatus.length,
      initialIndex: widget.type,
      child: Scaffold(
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
      child: Text('data'),
    );
  }
}

