import 'package:flutter/material.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/utils/size_fit.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:massageflutterapp/view_model/refresh_helper.dart';
import 'package:massageflutterapp/provider/provider_widget.dart';
import 'package:massageflutterapp/view_model/my_order_list_model.dart';

import 'package:massageflutterapp/config/resouce_manager.dart';

class MyCommentsPage extends StatefulWidget {

  @override
  _MyCommentsPageState createState() => _MyCommentsPageState();
}

class _MyCommentsPageState extends State<MyCommentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(S.of(context).myComments),
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
  @override
  Widget build(BuildContext context) {
    return  Card(
      margin:EdgeInsets.only(top:20.rpx,left:20.rpx,right: 20.rpx),
      child: Container(
        padding: EdgeInsets.all(20.rpx),
        child: Column(
          children: <Widget>[
            //信息
            Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(55.rpx),
                  child: Image.network(ImageHelper.img, width: 80.rpx, height: 80.rpx),
                ),
                SizedBox(width: 10.rpx,),
                Expanded(
                  child: Column(
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Text('3453453', style: TextStyle(color: Color(0xff999999), fontSize: 30.rpx,), overflow: TextOverflow.ellipsis,),
                          ),
                          Text('2020-10-10', style: TextStyle(color: Color(0xff999999), fontSize: 30.rpx,),overflow: TextOverflow.ellipsis,),
                        ],
                      ),
                      SizedBox(height: 10.rpx,),
                      Row(
                        children: <Widget>[
                          ...List.generate(5, (index){
                            return index<=3? Icon(Icons.star, color: Theme.of(context).accentColor, size: 20,):
                            Icon(Icons.star_border, color: Color(0xff999999), size: 20,);
                          }),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
//                          //图片
            Container(
              margin: EdgeInsets.only(top: 20.rpx),
              height: (7 / 3).ceil() * (194 + 40).rpx,
              child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10.rpx,
                      mainAxisSpacing: 10.rpx,
                      childAspectRatio: 1
                  ),
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return Image.network(
                      ImageHelper.img,
                      width: 194.rpx,
                      height: 194.rpx,
                    );
                  }),
            ),
            //项目
            Container(
              width: double.maxFinite,
              padding:EdgeInsets.all(20.rpx),
              color: Color(0xffeeeeee),
              child: Text('服务项目：妈咪产前护理配套',style:TextStyle(color: Color(0xff999999),fontSize: 26.rpx ),),
            ),
            SizedBox(height: 20.rpx,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                InkWell(
                  onTap: (){

                  },
                  child: Container(
                    padding: EdgeInsets.all(6),
                    margin: EdgeInsets.only(left: 20.rpx),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.rpx),
                        border: Border.all(color:Theme.of(context).accentColor, width: 0.5)
                    ),
                    child: Text('删除评论',style:TextStyle(color: Theme.of(context).accentColor,fontSize: 26.rpx ),),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
