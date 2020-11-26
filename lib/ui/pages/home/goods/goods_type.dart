import 'package:flutter/material.dart';
import 'package:massageflutterapp/config/resouce_manager.dart';
import 'package:massageflutterapp/config/router_manager.dart';
import 'package:massageflutterapp/utils/size_fit.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:massageflutterapp/view_model/refresh_helper.dart';
import 'package:massageflutterapp/provider/provider_widget.dart';
import 'package:massageflutterapp/view_model/my_order_list_model.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:massageflutterapp/ui/widgets/goods_item_with_focus.dart';
class GoodsTypePage extends StatefulWidget {
  var type;
  var index;
  GoodsTypePage(this.type,this.index);
  @override
  _GoodsTypePageState createState() => _GoodsTypePageState();
}

class _GoodsTypePageState extends State<GoodsTypePage> {
  var selected=1;//选中
  var goodsType=['还好','hj','ddd','rrrr'];

  @override
  Widget build(BuildContext context) {
    goodsType.insert(0, S.of(context).goodMassagist);//优秀按摩师添加
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.type),
      ),
      body: ProviderWidget(
          onModelReady: (model) {
            model.initData();
          },
          builder: (context,model,child){
            return Stack(
                children: <Widget>[
                  SmartRefresher(
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
                          Container(
                            height: 372.rpx,
                            color: Colors.black12,
                            child: Swiper(
                              loop: true,
                              autoplay: true,
                              autoplayDelay: 5000,
                              pagination:
                              SwiperPagination(builder: DotSwiperPaginationBuilder(size: 6, activeSize: 6, activeColor: Theme.of(context).accentColor)),
                              itemCount: [1,2,3].length,
                              itemBuilder: (ctx, index) {
                                return InkWell(
                                    onTap: () {
                                      //Navigator.of(context).pushNamed(RouteName.shopDetail, arguments: [homeModel.banners[index].goodsId]);
                                    },
                                    child: Container(
                                      child: Image.network(
                                          ImageHelper.img
                                      ),
                                    )//fixme:BannerImage(homeModel.banners[index])
                                );
                              },
                            ),
                          ),
                          GridView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.symmetric(vertical: 10),
                              itemCount:goodsType.length,
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  childAspectRatio:338/76
                              ),
                              itemBuilder: (context,index){
                                //优秀按摩师显示
                                return  InkWell(
                                  onTap: (){
                                    if(index==0){
                                      Navigator.of(context).pushNamed(RouteName.massagistList,arguments: ['']);
                                      return;
                                    }
                                    setState(() {
                                      selected=index;
                                    });

                                  },
                                  child: Container(
                                    width: double.maxFinite,
                                    decoration: BoxDecoration(
                                      color:selected==index?Theme.of(context).accentColor:Colors.white,
                                      borderRadius: BorderRadius.circular(10.rpx),
                                      gradient: LinearGradient( //背景径向渐变
                                        colors: selected==index?[Color(0xff6A3B08), Color(0xffC7A163)]:[Colors.white,Colors.white,],
                                      ),
                                      /*boxShadow: [ //卡片阴影
                                    BoxShadow(
                                        color: Colors.black54,
                                        offset: Offset(2.0, 2.0),
                                        blurRadius: 10.rpx
                                    )
                                  ]*/
                                    ),
                                    child: Center(
                                        child: Text('哈哈哈哈',style: TextStyle(color: selected==index?Colors.white:Color(0xff666666)),)),
                                  ),
                                );
                              }
                          ),
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
                  ),
                  Align(
                    alignment: Alignment(1, 0),
                    child:Container(
                      child: InkWell(
                        onTap: (){
                          launch("tel://18727275857");
                        },
                        child: Image.asset(ImageHelper.wrapAssets('goods_type_contact.png'),width:85.rpx,height: 138.rpx,),
                      ),
                    ),
                  )
                ]
            );
          }, model: MyOrderListModel()),
    );
  }
}


