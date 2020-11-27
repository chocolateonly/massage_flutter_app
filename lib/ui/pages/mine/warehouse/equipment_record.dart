import 'package:flutter/material.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/utils/size_fit.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:massageflutterapp/view_model/refresh_helper.dart';
import 'package:massageflutterapp/provider/provider_widget.dart';
import 'package:massageflutterapp/view_model/my_order_list_model.dart';
class EquipmentRecordPage extends StatefulWidget {
  @override
  _EquipmentRecordPageState createState() => _EquipmentRecordPageState();
}

class _EquipmentRecordPageState extends State<EquipmentRecordPage> {

  var index=0;
  @override
  Widget build(BuildContext context) {
    var tab=[
      S.of(context).equipmentUsedRecord,
      S.of(context).equipmentAddedRecord
    ];
    return DefaultTabController(
      length: tab.length,
      initialIndex: index,
      child: Scaffold(
        backgroundColor: Color(0xfff5f5f5),
        appBar: AppBar(
          centerTitle: true,
          title: Text(S.of(context).equipmentRecord),
          bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              isScrollable: true,
              tabs: List.generate(tab.length, (index) => Tab(text: tab[index]))),
        ),
        body: TabBarView(children: List.generate(tab.length, (index) => TabContent(index))),
      ),
    );
  }
}
class TabContent extends StatefulWidget {
  var index;

  TabContent(this.index);

  @override
  _TabContentState createState() => _TabContentState();
}

class _TabContentState extends State<TabContent> {

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

class ItemOrder extends StatelessWidget {
  var item;
  ItemOrder(this.item);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: Card(
        margin: EdgeInsets.only(left: 20.rpx,top: 20.rpx,right: 20.rpx),
        shape:  RoundedRectangleBorder(borderRadius:BorderRadius.circular(20.rpx)),
        child: Container(
            padding:EdgeInsets.all(20.rpx),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child:  Text('产后收腹产后收腹带纱布塑身带纱布塑身...',
                       style: TextStyle(color: Color(0xff333333),fontSize: 30.rpx),overflow: TextOverflow.ellipsis,),
                    ),
                    Text('2020-03-21 11:20',style: TextStyle(color: Color(0xff999999),fontSize: 28.rpx),overflow: TextOverflow.ellipsis,),
                  ],
                ),
                Text('束腹带x1',style: TextStyle(color: Color(0xff666666),fontSize: 28.rpx),overflow: TextOverflow.ellipsis,),
                Text('束腹带x1',style: TextStyle(color: Color(0xff666666),fontSize: 28.rpx),overflow: TextOverflow.ellipsis,),
              ],
            )
        ),
      ),
    );
  }
}
