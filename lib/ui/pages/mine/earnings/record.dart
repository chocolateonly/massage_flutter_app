import 'package:flutter/material.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/utils/size_fit.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:massageflutterapp/view_model/refresh_helper.dart';
import 'package:massageflutterapp/provider/provider_widget.dart';
import 'package:massageflutterapp/view_model/my_order_list_model.dart';

import 'package:massageflutterapp/config/resouce_manager.dart';
class ExchangeRecordPage extends StatefulWidget {

  @override
  _ExchangeRecordPageState createState() => _ExchangeRecordPageState();
}

class _ExchangeRecordPageState extends State<ExchangeRecordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(S.of(context).exchangeRecord),
      ),
      body:  ProviderWidget(
          onModelReady: (model) {
            model.initData();
          },
          builder: (context,model,child){
            return SmartRefresher(
                controller: model.refreshController,
                header: RefreshHeader(),
                footer: RefresherFooter(),
                onRefresh: model.refresh,
                onLoading: model.loadMore,
                enablePullUp: true,
                child:ListView.builder(
                    itemCount: model.list.length,
                    itemBuilder: (context, index) {
                      return ItemView(model.list[index]);
                    })
            );
          }, model: MyOrderListModel())
    );
  }
}

class ItemView extends StatefulWidget {
  var item;
  ItemView(this.item);
  @override
  _ItemViewState createState() => _ItemViewState();
}


class _ItemViewState extends State<ItemView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: Card(
        margin: EdgeInsets.only(left: 20.rpx,top: 20.rpx,right: 20.rpx),
        shape:  RoundedRectangleBorder(borderRadius:BorderRadius.circular(20.rpx)),
        child: Container(
            padding:EdgeInsets.all(20.rpx),
            child:Row(
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 10.rpx),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('提现',style: TextStyle(color: Color(0xff333333),fontSize: 30.rpx),overflow: TextOverflow.ellipsis,),
                              Text('2020-03-21 11：20：20',style: TextStyle(color: Color(0xffcccccc),fontSize: 28.rpx),overflow: TextOverflow.ellipsis,),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text('+4511',style: TextStyle(color: Color(0xffFF0000),fontSize: 30.rpx),overflow: TextOverflow.ellipsis,),
              ],
            )
        ),
      ),
    );
  }
}
