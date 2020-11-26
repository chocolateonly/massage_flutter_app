import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:massageflutterapp/config/resouce_manager.dart';
import 'package:massageflutterapp/utils/size_fit.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/provider/provider_widget.dart';
import 'package:massageflutterapp/view_model/order_detail_model.dart';
import 'package:massageflutterapp/view_model/my_order_list_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:massageflutterapp/view_model/refresh_helper.dart';
import 'package:massageflutterapp/ui/pages/mine/workplace/get_service_order_button.dart';
import 'package:massageflutterapp/ui/pages/mine/work_platform.dart';
class ServiceOrderRoomPage extends StatefulWidget {

  @override
  _ServiceOrderRoomPageState createState() => _ServiceOrderRoomPageState();
}

class _ServiceOrderRoomPageState extends State<ServiceOrderRoomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('接单大厅'),
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
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: model.list.length,
                    itemBuilder: (context, index) {
                      return ItemOrder(model.list[index]);
                    }),
              ),
            );
          },
          model1:OrderDetailModel(),
          model2:MyOrderListModel(),
        )
    );
  }
}

