import 'package:flutter/material.dart';
import 'package:massageflutterapp/config/resouce_manager.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/utils/size_fit.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:massageflutterapp/view_model/refresh_helper.dart';
import 'package:massageflutterapp/provider/provider_widget.dart';
import 'package:massageflutterapp/view_model/my_order_list_model.dart';

import 'package:flutter/cupertino.dart';
import 'package:massageflutterapp/config/router_manager.dart';
class MassagistListPage extends StatefulWidget {
  var type;
  MassagistListPage(this.type);
  @override
  _MassagistListPageState createState() => _MassagistListPageState();
}

class _MassagistListPageState extends State<MassagistListPage> {
  final _searchController=TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(S.of(context).goodMassagist),
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
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow:[BoxShadow(color: Color(0xffcccccc))]
                      ),
                      padding:EdgeInsets.symmetric(horizontal: 20.rpx),
                      height: 70.rpx,
                      margin:EdgeInsets.symmetric(vertical:20.rpx),
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            ImageHelper.wrapAssets('home_icon_search.png'),
                            width:36.rpx,
                            height: 36.rpx,
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.rpx),
                              child: TextField(
                                controller: _searchController,
                                textAlignVertical:TextAlignVertical.center,
                                style:TextStyle(fontSize: 26.rpx,),
                                maxLines: 1,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText:S.of(context).searchPlaceholder,
                                    isDense: true // 是否为密集形式（使用较少垂直空间），默认为false
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              //todo:去搜索
                              print(_searchController.text);
                            },
                            child: Text(
                              S.of(context).search,
                              style: TextStyle(color: Theme.of(context).accentColor,fontSize: 26.rpx),
                            ),
                          )
                        ],
                      ),
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
        Navigator.of(context).pushNamed(RouteName.massagistDetail,arguments: ['']);
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
                    Row(
                      children: <Widget>[
                        Container(
                          margin:EdgeInsets.only(right: 10.rpx),
                          constraints: BoxConstraints(maxWidth: 140.rpx),
                            child: Text(widget.item.name,style:TextStyle(color:   Color(0xff333333),fontSize: 30.rpx),overflow: TextOverflow.ellipsis,)
                        ),
                        Container(
                           padding: EdgeInsets.symmetric(vertical:6.rpx,horizontal: 10.rpx),
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(20.rpx),
                             border: Border.all(color: Theme.of(context).accentColor)
                           ),
                           child: Row(
                             children: <Widget>[
                               Image.asset(ImageHelper.wrapAssets('massagist_level1.png'),width: 24.rpx,height: 19.rpx,),
                               SizedBox(width:10.rpx),
                                 Text('${S.of(context).levelAbb} 1',style:TextStyle(color:Theme.of(context).accentColor,fontSize: 24.rpx ),overflow: TextOverflow.ellipsis,),
                             ],
                           ),
                        )
                      ],
                    ),
                    SizedBox(height:10.rpx),
                   //
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex:1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Image.asset(ImageHelper.wrapAssets('massagist_point.png'),width: 24.rpx,height: 24.rpx,),
                              SizedBox(width:10.rpx),
                              Text('${S.of(context).score} 4.5',style:TextStyle(color: Color(0xff333333),fontSize: 24.rpx ),overflow: TextOverflow.ellipsis,),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Image.asset(ImageHelper.wrapAssets('massagist_comment.png'),width: 24.rpx,height: 24.rpx,),
                              SizedBox(width:10.rpx),
                              Text('${S.of(context).comment} 356',style:TextStyle(color: Color(0xff333333),fontSize: 24.rpx ),overflow: TextOverflow.ellipsis,),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}

