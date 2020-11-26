import 'package:flutter/material.dart';
import 'package:massageflutterapp/config/resouce_manager.dart';
import 'package:massageflutterapp/config/router_manager.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/utils/size_fit.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:massageflutterapp/view_model/refresh_helper.dart';
import 'package:massageflutterapp/provider/provider_widget.dart';
import 'package:massageflutterapp/view_model/my_order_list_model.dart';

import 'package:flutter/cupertino.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
class MassagistServiceProvePage extends StatefulWidget {
  var id;
  MassagistServiceProvePage(this.id);
  @override
  _MassagistServiceProvePageState createState() => _MassagistServiceProvePageState();
}

class _MassagistServiceProvePageState extends State<MassagistServiceProvePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('服务资质'),
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
                        return ItemView(model.list[index]);
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

class ItemView extends StatefulWidget {
  var item;

  ItemView(this.item);
  @override
  _ItemViewState createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        //查看图片
      },
      child: Card(
        clipBehavior: Clip.antiAlias,//超出剪切
        shape:  RoundedRectangleBorder(borderRadius:BorderRadius.circular(20.rpx)),
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Container(
                    width: double.maxFinite,
                    height: 328.rpx,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit:BoxFit.cover,
                            image:NetworkImage(ImageHelper.wrapUrl(ImageHelper.img))
                        )
                    ),
                  ),
                ),
                Container(
                    padding: EdgeInsets.all(10),
                    child: Center(
                        child: Text(widget.item.name,style:TextStyle(color:   Color(0xff333333),fontSize: 34.rpx),overflow: TextOverflow.ellipsis,)
                    )
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

