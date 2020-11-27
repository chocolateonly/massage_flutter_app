import 'package:flutter/material.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/utils/size_fit.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:massageflutterapp/view_model/refresh_helper.dart';
import 'package:massageflutterapp/provider/provider_widget.dart';
import 'package:massageflutterapp/view_model/my_order_list_model.dart';

import 'package:massageflutterapp/config/resouce_manager.dart';
import 'package:massageflutterapp/config/router_manager.dart';
class MyCouponsPage extends StatefulWidget {

  @override
  _MyCouponsPageState createState() => _MyCouponsPageState();
}

class _MyCouponsPageState extends State<MyCouponsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(S.of(context).myCoupons),
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

  var current_status=1;
  @override
  Widget build(BuildContext context) {
    var status=[
      S.of(context).useStatus,
      S.of(context).used,
      S.of(context).useOver
     ];
    return  Container(
      margin:EdgeInsets.only(top:20.rpx),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width:174.rpx,
            height:201.rpx,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(ImageHelper.wrapAssets(current_status==0?'m_c_left_active.png':'m_c_left.png')))
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment:MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: <Widget>[
                    Text(S.of(context).priceUnit,style: TextStyle(color: Colors.white,fontSize: 30.rpx),),
                    Text('30',style: TextStyle(color: Colors.white,fontSize: 50.rpx),),
                  ],
                ),
                Text(S.of(context).couponsUseTip(100),style: TextStyle(color: Colors.white,fontSize: 30.rpx),),
              ],
            ),
          ),
          Container(
            width:510.rpx,
            height:201.rpx,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(ImageHelper.wrapAssets('m_c_right.png')))
            ),
            child: Row(
              children: <Widget>[
                SizedBox(width: 20.rpx,),
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('新人优惠券',style: TextStyle(color: current_status==0?Colors.black:Color(0xff666666),fontSize: 30.rpx),),
                          Text('一个配套仅限使用一张,不可叠加',style: TextStyle(color: Color(0xff666666),fontSize: 24.rpx),overflow: TextOverflow.ellipsis,),
                          Text('${S.of(context).canUseDate}：2020.12.01',style: TextStyle(color: Color(0xff666666),fontSize: 24.rpx),),
                        ],
                      ),
                      (current_status==1?Positioned(
                        right: 20.rpx,
                        top: 43.rpx,
                        child: Image.asset(ImageHelper.wrapAssets('m_c_used.png'),width: 114.rpx,height: 89.rpx,),
                      ):current_status==2?Positioned(
                        right: 20.rpx,
                        top: 43.rpx,
                        child: Image.asset(ImageHelper.wrapAssets('m_c_over.png'),width: 114.rpx,height: 89.rpx,),
                      ):Container())

                    ],
                  ),
                ),
                //0立即使用  1已使用  2已过期

                InkWell(
                  onTap: (){
                     if(current_status==0){
                       Navigator.of(context).pushNamed(RouteName.tab);
                     }
                  },
                  child: Container(
                    width:160.rpx,
                    height: 210.rpx,
                    padding: EdgeInsets.symmetric(horizontal: 20.rpx),
                    decoration: BoxDecoration(
                        border: Border(left: BorderSide(color: Color(0xffeeeeee)))
                    ),
                      child: Center(
                        child: Text(status[current_status],style: TextStyle(color:  current_status==0?Theme.of(context).accentColor:Color(0xff666666),fontSize:26.rpx),),
                      ),
                  ),
                ),

              ],
            ),
          ),
        ],
      )
    );
  }
}
