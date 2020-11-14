import 'package:flutter/material.dart';
import 'package:massageflutterapp/config/resouce_manager.dart';
import 'package:massageflutterapp/config/router_manager.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/ui/weidge/banner_image.dart';
import 'package:massageflutterapp/utils/size_fit.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var homeType=['home_type1.png','home_type2.png','home_type3.png','home_type4.png'];
  var banners = ['home_banner.png'];
  final _searchController=TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(S.of(context).homeTitle),
      ),
      body: NotificationListener(
        onNotification: (ScrollNotification notification) {
          FocusScope.of(context).requestFocus(new FocusNode());
          return true;
        },
        child: ListView(
          children: <Widget>[
            Container(
              height: 500.rpx,
              decoration:BoxDecoration(
                  color:Colors.transparent  //背景颜色 Theme.of(context).accentColor
              ),
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 100.px,
                    decoration:BoxDecoration(
                        color:Theme.of(context).accentColor //背景颜色 Theme.of(context).accentColor
                    ),
                  ),
                  Positioned(
                    top:100.rpx,
                    left:20.rpx,
                    right:20.rpx,
                    child:  Container(
                      height: 387.5.rpx,
                      child: Swiper(
                        loop: true,
                        autoplay: true,
                        autoplayDelay: 5000,
                        pagination:
                        SwiperPagination(builder: DotSwiperPaginationBuilder(size: 6, activeSize: 6, activeColor: Theme.of(context).accentColor)),
                        itemCount: banners.length,
                        itemBuilder: (ctx, index) {
                          return InkWell(
                              onTap: () {
                                //Navigator.of(context).pushNamed(RouteName.shopDetail, arguments: [banners[index].goodsId]);
                              },
                              child: Container(
                                child: Image.asset(
                                  ImageHelper.wrapAssets(banners[index]),
                                ),
                              )//BannerImage(banners[index])
                          );
                        },
                      ),
                    ),
                  ),
                  Container(
                    padding:EdgeInsets.symmetric(horizontal:30.rpx),
                    child: Row( //搜索 多语言
                      children: <Widget>[
                        InkWell(  //水波纹按钮
                          onTap: (){
                            Navigator.of(context).pushNamed(RouteName.language);
                          },
                          child: Container(
                            width: 130.rpx,
                            decoration: BoxDecoration(
                              //color: Colors.brown
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                    constraints:BoxConstraints(maxWidth: 100.rpx),//给最大宽
                                    child: Text(
                                      getLanguage(context),
                                      style: TextStyle(color: Colors.white,fontSize: 36.rpx),overflow: TextOverflow.ellipsis,textAlign: TextAlign.center
                                    )
                                ),
                                Image.asset(
                                  ImageHelper.wrapAssets("icon_check_language.png"),
                                  width: 30.rpx,
                                  height: 30.rpx,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding:EdgeInsets.symmetric(horizontal: 20.rpx),
                            height: 70.rpx,
                            margin:EdgeInsets.only(left:20.rpx),
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
                                      readOnly: true,
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
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: ListView.builder(
                shrinkWrap: true, 								//解决无限高度问题
                physics: new NeverScrollableScrollPhysics(),		//禁用滑动事件
                itemCount:homeType.length,
                itemBuilder: (context,index){
                  return Container(
                    padding:EdgeInsets.symmetric(horizontal:20.rpx),
                    margin: EdgeInsets.only(bottom: 10.rpx),
                    decoration: BoxDecoration(
                      //color: index==0?Colors.green:Colors.red,
                    ),
                    child: Image.asset(
                      ImageHelper.wrapAssets(homeType[index]),
                      height: 150.rpx,
                    ),
                  );
                },
              ),
            )

          ],
        ),
      )
    );
  }
}
