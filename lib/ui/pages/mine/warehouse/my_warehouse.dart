import 'package:flutter/material.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/utils/size_fit.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:massageflutterapp/view_model/refresh_helper.dart';
import 'package:massageflutterapp/provider/provider_widget.dart';
import 'package:massageflutterapp/view_model/my_order_list_model.dart';

import 'package:massageflutterapp/ui/widgets/button/theme_button.dart';

import 'package:massageflutterapp/config/router_manager.dart';
import 'package:massageflutterapp/config/resouce_manager.dart';
class MyWarehousePage extends StatefulWidget {
  @override
  _MyWarehousePageState createState() => _MyWarehousePageState();
}

class _MyWarehousePageState extends State<MyWarehousePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(S.of(context).myWareHouse),
          actions: <Widget>[
            InkWell(
                onTap: (){
                  //
                  Navigator.of(context).pushNamed(RouteName.equipmentRecord);
                },
                child: Center(child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('库存明细'),
                )))
          ],
        ),
        body:  ProviderWidget(
            onModelReady: (model) {
              model.initData();
            },
            builder: (context,model,child){
              return Column(
                children: <Widget>[
                  Expanded(
                    flex:1,
                    child: SmartRefresher(
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
                    ),
                  ),
                  ThemeButton(
                      title: '我要补货',
                      onPressed: () {
                        Navigator.of(context).pushNamed(RouteName.addEquipment);
                      })
                ],
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
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.rpx),
                    padding: EdgeInsets.all(10.rpx),
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(30.rpx)
                    ),
                    child: Text('01',style: TextStyle(color: Colors.white,fontSize: 26.rpx),overflow: TextOverflow.ellipsis,)
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Image.network(ImageHelper.img,width:80.rpx,height: 80.rpx,),
                      SizedBox(width: 10.rpx,),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 10.rpx),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('束腹带...',style: TextStyle(color: Color(0xff333333),fontSize: 30.rpx),overflow: TextOverflow.ellipsis,),
                              Text('库存：345',style: TextStyle(color: Theme.of(context).accentColor,fontSize: 28.rpx),overflow: TextOverflow.ellipsis,),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
}