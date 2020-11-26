import 'package:flutter/material.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/utils/size_fit.dart';
import 'package:massageflutterapp/ui/widgets/button/theme_button.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:massageflutterapp/config/resouce_manager.dart';

import 'package:massageflutterapp/provider/provider_widget.dart';
import 'package:massageflutterapp/view_model/home_model.dart';

import 'package:flutter_html/flutter_html.dart';
class PointDetailPage extends StatefulWidget {
  var id;
  PointDetailPage(this.id);
  @override
  _PointDetailPageState createState() => _PointDetailPageState();
}

class _PointDetailPageState extends State<PointDetailPage> {
  @override
  Widget build(BuildContext context) {
    var title='商品详情';
    var  ruleTitle="使用规则";
    var goodsDetailTitle='产品详情';
    var submit='立即兑换';

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: ProviderWidget(
          builder: (context,model,child){
            return GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap:  (){
                //点击输入框以外的地方  收起键盘
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 756.rpx,
                      color: Colors.black12,
                      child: Swiper(
                        loop: true,
                        autoplay: true,
                        autoplayDelay: 5000,
                        pagination:
                        SwiperPagination(builder: DotSwiperPaginationBuilder(size: 6, activeSize: 6, activeColor: Theme.of(context).accentColor)),
                        itemCount: model.banners.length,
                        itemBuilder: (ctx, index) {
                          return InkWell(
                              onTap: () {
                                //Navigator.of(context).pushNamed(RouteName.shopDetail, arguments: [homeModel.banners[index].goodsId]);
                              },
                              child: Container(
                                child: Image.asset(
                                  ImageHelper.wrapAssets(model.banners[index])
                                ),
                              )//fixme:BannerImage(homeModel.banners[index])
                          );
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20.rpx),
                      color: Theme.of(context).accentColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('产后收腹带纱布产妇束腹修复孕妇',style: TextStyle(color: Colors.white,fontSize: 30.rpx),overflow: TextOverflow.ellipsis,),
                          SizedBox(height: 20.rpx,),
                          Container(
                            padding: EdgeInsets.all(20.rpx),
                            color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('1880积分',style: TextStyle(color: Color(0xffFF0000),fontSize: 34.rpx),overflow: TextOverflow.ellipsis,),
                                Image.asset(ImageHelper.wrapAssets('my_point_price_core.png'),width:79.rpx,height:70.rpx)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20.rpx),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(ruleTitle,style: TextStyle(color: Color(0xff000000),fontSize: 30.rpx),overflow: TextOverflow.ellipsis,),
                          SizedBox(height: 20.rpx,),
                          Text('1.这里是规则说明内容详情这里是规则说明内容详情这里是规则说明内容详情这里是规则说明内容详情。 2.这里是规则说明内容详情这里',
                            style: TextStyle(color: Color(0xff666666),fontSize: 24.rpx),maxLines: null,),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20.rpx),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(goodsDetailTitle,style: TextStyle(color: Color(0xff000000),fontSize: 30.rpx),overflow: TextOverflow.ellipsis,),
                          SizedBox(height: 20.rpx,),
                          Html(
                            data: 'data',
                          )
                        ],
                      ),
                    ),
                    ThemeButton(
                        title: submit,
                        onPressed:(){
                          //todo:处理表单
                        }
                    )
                  ],
                ),
              ),
            );
          },
          model: HomeModel())
    );
  }
}
