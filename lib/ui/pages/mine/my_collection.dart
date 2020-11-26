import 'package:flutter/material.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/config/router_manager.dart';
import 'package:massageflutterapp/utils/size_fit.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:massageflutterapp/view_model/refresh_helper.dart';
import 'package:massageflutterapp/provider/provider_widget.dart';
import 'package:massageflutterapp/view_model/my_order_list_model.dart';

import 'package:flutter/cupertino.dart';

import 'package:massageflutterapp/ui/widgets/goods_item_with_focus.dart';
class MyCollectionPage extends StatefulWidget {

  @override
  _MyCollectionPageState createState() => _MyCollectionPageState();
}

class _MyCollectionPageState extends State<MyCollectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(S.of(context).myCollection),
      ),
      body: ProviderWidget(
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
              child: SingleChildScrollView(
                padding: EdgeInsets.all(20.rpx),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    GridView.builder(
                      shrinkWrap: true,
                      itemCount: model.list.length,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 333/486 //子元素的宽高比
                      ),
                      itemBuilder: (context, index) {
                        return GoodsItemFocus(
                          model.list[index],
                          onClickItem: (){
                            Navigator.of(context).pushNamed(RouteName.goodsDetail,arguments: [model.list[index].id]);
                          },);
                      },
                    )
                  ],
                ),
              ),
            );
          }, model: MyOrderListModel()),
    );
  }
}
