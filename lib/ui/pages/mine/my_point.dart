import 'package:flutter/material.dart';
import 'package:massageflutterapp/config/resouce_manager.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/utils/size_fit.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:massageflutterapp/view_model/refresh_helper.dart';
import 'package:massageflutterapp/provider/provider_widget.dart';
import 'package:massageflutterapp/view_model/my_order_list_model.dart';
import 'package:massageflutterapp/config/router_manager.dart';
import 'package:flutter/cupertino.dart';
class MyPointPage extends StatefulWidget {

  @override
  _MyPointPageState createState() => _MyPointPageState();
}

class _MyPointPageState extends State<MyPointPage> {
  var selected=0;//选中
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(S.of(context).myPoint),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
//                积分
                Container(
                  width:double.maxFinite,
                  height: 340.rpx,
                  decoration: BoxDecoration(
//                背景图
                    image: new DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(ImageHelper.wrapAssets('my_point_bg.png')),
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(child: Text(S.of(context).myPoint,style: TextStyle(color: Colors.white,fontSize: 32.rpx),overflow: TextOverflow.ellipsis,)),
                            FlatButton(
                              color: Colors.white,
                              onPressed: (){
                                Navigator.of(context).pushNamed(RouteName.pointRecord);
                              },
                              child: Text(S.of(context).myPointRecord,style: TextStyle(color: Color(0xff6F6349),fontSize: 30.rpx),),
                              shape: StadiumBorder(
                                side: BorderSide(
                                  width: 2,
                                  color: Colors.red,
                                  // style: BorderStyle.solid,
                                  style: BorderStyle.none,
                                ),
                              ),
                            )
                          ],
                        ),
                        Text('879879',style: TextStyle(color: Colors.white,fontSize: 83.rpx),overflow: TextOverflow.ellipsis,),
                      ],
                    ),
                  ),
                ),
//                商品标题
                Container(
                  padding:  EdgeInsets.symmetric(vertical: 20.rpx,horizontal: 20.rpx),
                  child:  Text(S.of(context).allGoods,style: TextStyle(color: Color(0xff333333),fontSize: 36.rpx),overflow: TextOverflow.ellipsis,),
                ),
//todo
                Container(
                  width: double.maxFinite,
                  height: 70.rpx,
                  padding:EdgeInsets.symmetric(horizontal: 20.rpx),
                  child: CustomScrollView(
                    scrollDirection: Axis.horizontal,
                    slivers: <Widget>[
                      SliverToBoxAdapter(child: Container(color: Theme.of(context).accentColor, height: 8, margin: EdgeInsets.only(top: 10))),
                      SliverList(
                          delegate: SliverChildBuilderDelegate((BuildContext context,int index){
                            return Container(
                                padding:index==0?EdgeInsets.symmetric(horizontal: 10):EdgeInsets.only(right: 10),
                                child: InkWell(
                                  onTap: (){
                                    setState(() {
                                      selected=index;
                                    });
                                    model.refresh(init:true);
                                  },
                                  child: Chip(
                                    label: Text('哈哈哈哈',style: TextStyle(color: selected==index?Colors.white:Color(0xff666666)),),
                                    backgroundColor: selected==index?Theme.of(context).accentColor:Colors.white,
                                    shadowColor: Colors.grey,
                                    elevation: 0.8,
                                  ),
                                )
                            );
                          },
                              childCount: 10

                          )

                      ),
                      SliverToBoxAdapter(child: Container(height: 8, color: Theme.of(context).accentColor)),
                    ],
                  ),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  itemCount: model.list.length,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 333/510 //子元素的宽高比
                  ),
                  itemBuilder: (context, index) {
                    return ItemView(model.list[index]);
                  },
                )
              ],
            ),
          ),
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
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(RouteName.pointDetail,arguments: ['id']);
      },
      child: Card(
        clipBehavior: Clip.antiAlias,//超出剪切
        shape:  RoundedRectangleBorder(borderRadius:BorderRadius.circular(20.rpx)),
        child: Column(
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget.item.name,style:TextStyle(color:   Color(0xff333333),fontSize: 34.rpx),overflow: TextOverflow.ellipsis,),
                    Text('4534'+S.of(context).point,style:TextStyle(color:   Color(0xffFF2544),fontSize: 30.rpx),overflow: TextOverflow.ellipsis,),
                    Text(S.of(context).numberOfChange(23),style:TextStyle(color:   Color(0xff999999),fontSize: 24.rpx),overflow: TextOverflow.ellipsis,),
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}

