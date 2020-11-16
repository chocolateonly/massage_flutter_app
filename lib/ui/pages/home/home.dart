import 'package:flutter/material.dart';
import 'package:massageflutterapp/config/resouce_manager.dart';
import 'package:massageflutterapp/config/router_manager.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/ui/weidge/banner_image.dart';
import 'package:massageflutterapp/utils/size_fit.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:massageflutterapp/view_model/home_model.dart';
import 'package:massageflutterapp/provider/provider_widget.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _searchController=TextEditingController(text: '');
  @override
  void initState() {
    print('object');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(S.of(context).homeTitle),
      ),
      body: ProviderWidget<HomeModel>(
        onModelReady: (homeModel){
          //初始化状态是调用页面初始数据
          homeModel.loadHome();
        },
        builder: (context,homeModel,child){
          return NotificationListener(  //页面有输入框时的失焦操作
              onNotification: (ScrollNotification notification) {
                FocusScope.of(context).requestFocus(new FocusNode());
                return true;
              },
              child:ListView(
                children: <Widget>[
                  Container(
                    height: 500.rpx,
                    decoration:BoxDecoration(
                        color:Colors.transparent  //背景颜色 Theme.of(context).accentColor
                    ),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          height: 200.rpx,
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
                              itemCount: homeModel.banners.length,
                              itemBuilder: (ctx, index) {
                                return InkWell(
                                    onTap: () {
                                      //Navigator.of(context).pushNamed(RouteName.shopDetail, arguments: [homeModel.banners[index].goodsId]);
                                    },
                                    child: Container(
                                      child: Image.asset(
                                        ImageHelper.wrapAssets(homeModel.banners[index]),
                                      ),
                                    )//fixme:BannerImage(homeModel.banners[index])
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
                      itemCount:homeModel.homeType.length,
                      itemBuilder: (context,index){
                        return Container(
                          padding:EdgeInsets.symmetric(horizontal:20.rpx),
                          margin: EdgeInsets.only(bottom: 10.rpx),
                          decoration: BoxDecoration(
                            //color: index==0?Colors.green:Colors.red,
                          ),
                          child: Image.asset(
                            ImageHelper.wrapAssets(homeModel.homeType[index]),
                            height: 150.rpx,
                          ),
                        );
                      },
                    ),
                  )
                ],
              )
          );
        },
        model: HomeModel(),
      )
    );
  }
}
