import 'package:flutter/material.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/utils/size_fit.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:massageflutterapp/view_model/refresh_helper.dart';
import 'package:massageflutterapp/provider/provider_widget.dart';
import 'package:massageflutterapp/view_model/my_order_list_model.dart';

import 'package:massageflutterapp/config/resouce_manager.dart';
class AccountListPage extends StatefulWidget {

  @override
  _AccountListPageState createState() => _AccountListPageState();
}

class _AccountListPageState extends State<AccountListPage> {
  @override
  Widget build(BuildContext context) {
    var myAccount="我的账号";
    var add="添加";
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(myAccount),
        actions: <Widget>[
          InkWell(
              onTap: (){
                //
              },
              child: Center(child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(add),
              )))
        ],
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

    var defaultTitle="默认";
    var edit="编辑";
    var delete="删除";
    return Container(
      width: double.maxFinite,
      child: Card(
        margin: EdgeInsets.only(left: 20.rpx,top: 20.rpx,right: 20.rpx),
        shape:  RoundedRectangleBorder(borderRadius:BorderRadius.circular(20.rpx)),
        child: Container(
            padding:EdgeInsets.all(40.rpx),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Row(
                          children: <Widget>[
                            Container(
                              constraints: BoxConstraints(maxWidth: double.maxFinite),
                              child: Text('姓名',
                                style: TextStyle(color: Color(0xff333333),fontSize: 30.rpx),overflow: TextOverflow.ellipsis,),
                            ),
                            (isDefault?Chip(
                              label: Text(defaultTitle),
                              labelPadding: EdgeInsets.symmetric(horizontal: 4,vertical: 0),
                              labelStyle: TextStyle(color: Theme.of(context).accentColor,fontSize: 24.rpx),
                              backgroundColor: Color(0xffFAF1EA),
                            ):Text('')),
                          ],
                        )
                    ),
                    Text('银行卡号',style: TextStyle(color: Color(0xff333333),fontSize: 30.rpx),overflow: TextOverflow.ellipsis,),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20.rpx),
                  child: Text('3453453453',style: TextStyle(color: Color(0xff999999),fontSize: 34.rpx),overflow: TextOverflow.ellipsis,),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    InkWell(
                      onTap: (){},
                      child: Row(
                        children: <Widget>[
                          Image.asset(ImageHelper.wrapAssets('icon_edit.png'),width: 30.rpx,height: 30.rpx,),
                          Text(edit,style: TextStyle(color: Color(0xff333333),fontSize: 26.rpx),overflow: TextOverflow.ellipsis,),
                        ],
                      ),
                    ),
                    SizedBox(width: 10.rpx,),
                    InkWell(
                      onTap: (){},
                      child: Row(
                        children: <Widget>[
                          Image.asset(ImageHelper.wrapAssets('icon_delete.png'),width: 30.rpx,height: 30.rpx,),
                          Text(delete,style: TextStyle(color: Color(0xff333333),fontSize: 26.rpx),overflow: TextOverflow.ellipsis,),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            )
        ),
      ),
    );
  }
}