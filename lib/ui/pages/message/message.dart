import 'package:flutter/material.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/utils/size_fit.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:massageflutterapp/view_model/refresh_helper.dart';
import 'package:massageflutterapp/provider/provider_widget.dart';
import 'package:massageflutterapp/view_model/my_order_list_model.dart';

import 'package:massageflutterapp/config/resouce_manager.dart';
class MessagePage extends StatefulWidget {

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(S.of(context).messageTip),
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
  var isDefault=true;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: Column(
        children: <Widget>[
          Chip(
              label: Text('01-03 19:38',style: TextStyle(color: Colors.white,fontSize: 22.rpx),overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,),
              backgroundColor: Color(0xffdddddd),
          ),
          Card(
            margin: EdgeInsets.only(left: 20.rpx,right: 20.rpx),
            shape:  RoundedRectangleBorder(borderRadius:BorderRadius.circular(20.rpx)),
            child: Container(
                padding:EdgeInsets.all(40.rpx),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Image.asset(ImageHelper.wrapAssets('m_icon.png'),width: 35.rpx,height: 35.rpx,),
                        SizedBox(width: 10.rpx,),
                        Text(S.of(context).systemNotice,style: TextStyle(color: Color(0xff333333),fontSize: 30.rpx),overflow: TextOverflow.ellipsis,),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 20.rpx),
                      child: Text('您有新的预约订单，请合理安排自己的时间，按时 为顾客上门进行服务! 拷贝',style: TextStyle(color: Color(0xff666666),fontSize: 28.rpx),maxLines: null,),
                    ),
                  ],
                )
            ),
          ),
        ],
      ),
    );
  }
}
