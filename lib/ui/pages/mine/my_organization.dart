import 'package:flutter/material.dart';
import 'package:massageflutterapp/config/resouce_manager.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/utils/size_fit.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:massageflutterapp/view_model/refresh_helper.dart';
import 'package:massageflutterapp/provider/provider_widget.dart';
import 'package:massageflutterapp/view_model/my_order_list_model.dart';

import 'package:flutter/cupertino.dart';

import 'package:massageflutterapp/ui/widgets/my_invite_code.dart';
class MyOrganizationPage extends StatefulWidget {

  @override
  _MyOrganizationPageState createState() => _MyOrganizationPageState();
}

class _MyOrganizationPageState extends State<MyOrganizationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(S.of(context).myOrganization),
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
                   Container(
                     width:double.maxFinite,
                     padding: EdgeInsets.only(top:20.rpx,left:20.rpx,right:20.rpx),
                     decoration: BoxDecoration(
                       color: Theme.of(context).accentColor
                     ),
                       child: MyInviteCode()
                   ),
//                    统计
                    Container(
                      width:double.maxFinite,
                      height: 234.rpx,
                      decoration: BoxDecoration(
//                背景图
                        image: new DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(ImageHelper.wrapAssets('my_org_bg.png')),
                        ),
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text('453453',style: TextStyle(color: Colors.white,fontSize: 50.rpx),overflow: TextOverflow.ellipsis,),
                                Text(S.of(context).orgMember,style: TextStyle(color: Colors.white,fontSize: 30.rpx),),
                              ],
                            ),
                          ),
                          Container(
                              width:2.rpx,
                              height: 100.rpx,
                              color:Colors.white
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text('453453',style: TextStyle(color: Colors.white,fontSize: 50.rpx),overflow: TextOverflow.ellipsis,),
                                Text(S.of(context).orgEarnings+'(${S.of(context).priceUnit})',style: TextStyle(color: Colors.white,fontSize: 30.rpx),),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: model.list.length,
                        itemBuilder: (context, index) {
                          return ItemView(model.list[index]);
                        })
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
    return Container(
      width: double.maxFinite,
      padding:EdgeInsets.all(20.rpx),
      child: Container(
          padding:EdgeInsets.symmetric(vertical:20.rpx),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(bottom: BorderSide(color: Color(0xffeeeeee)))
          ),
          child:Row(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    ClipRRect(
                        borderRadius: BorderRadius.circular(40.rpx),
                        child: Image.network(ImageHelper.img,width:80.rpx,height: 80.rpx,)
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 10.rpx),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('花花',style: TextStyle(color: Color(0xff000000),fontSize: 34.rpx),overflow: TextOverflow.ellipsis,),
                            Text('2020-07-15  12:14:15',style: TextStyle(color: Color(0xff666666),fontSize: 24.rpx),overflow: TextOverflow.ellipsis,),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text('-4511',style: TextStyle(color: Color(0xff333333),fontSize: 30.rpx),overflow: TextOverflow.ellipsis,),
            ],
          )
      ),
    );
  }
}