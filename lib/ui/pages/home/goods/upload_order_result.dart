import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/utils/size_fit.dart';
import 'package:massageflutterapp/ui/widgets/button/theme_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:massageflutterapp/config/resouce_manager.dart';
import 'package:massageflutterapp/config/router_manager.dart';
import 'package:massageflutterapp/ui/widgets/form/form_item.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:massageflutterapp/ui/widgets/upload_picture_widget.dart';
class UploadOrderResultPage extends StatefulWidget {
  UploadOrderResultPage(id);


  @override
  _UploadOrderResultPageState createState() => _UploadOrderResultPageState();
}

class _UploadOrderResultPageState extends State<UploadOrderResultPage> {
  var _remarkController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(S.of(context).uploadOrderResult),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap:  (){
          //点击输入框以外的地方  收起键盘
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          padding:EdgeInsets.all(20.rpx),
          child: Column(
            children: <Widget>[
              Container(
                width:double.maxFinite,
                height: 417.rpx,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.rpx),
                ),
                child: Container(
                  height: 417.rpx,
                  child: Swiper(
                    loop: true,
                    autoplay: true,
                    autoplayDelay: 5000,
                    pagination:
                    SwiperPagination(builder: DotSwiperPaginationBuilder(size: 6, activeSize: 6, activeColor: Theme.of(context).accentColor)),
                    itemCount: 2,
                    itemBuilder: (ctx, index) {
                      return InkWell(
                          onTap: () {
                            //Navigator.of(context).pushNamed(RouteName.shopDetail, arguments: [homeModel.banners[index].goodsId]);
                          },
                          child: Container(
                            child: Image.network(ImageHelper.img),
                          )//fixme:BannerImage(homeModel.banners[index])
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 20.rpx,),
              Container(
                width:double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.rpx),
                ),
                child:Padding(
                  padding:  EdgeInsets.all(20.rpx),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin:EdgeInsets.only(top: 20.rpx,left:20.rpx,right:20.rpx),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.rpx),
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding:EdgeInsets.symmetric(vertical: 20.rpx),
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Color(0xffeeeeee)))
                              ),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(S.of(context).payAccount+":",style: TextStyle(color:Color(0xff333333),fontSize: 30.rpx)),
                                    SizedBox(width:10.rpx),
                                    Text(S.of(context).orderNum,style: TextStyle(color:Color(0xff666666),fontSize: 30.rpx)),
                                  ]
                              ),
                            ),
                            Container(
                              padding:EdgeInsets.symmetric(vertical: 20.rpx),
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Color(0xffeeeeee)))
                              ),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(S.of(context).payNumber+":",style: TextStyle(color:Color(0xff333333),fontSize: 30.rpx)),
                                    SizedBox(width:10.rpx),
                                    Text(S.of(context).orderNum,style: TextStyle(color:Color(0xff666666),fontSize: 30.rpx)),
                                  ]
                              ),
                            ),

                            FormItem(label:S.of(context).payeeAccount,controller:_remarkController,textAlign:TextAlign.left),
                            FormItem(label:S.of(context).payeeNumber,controller:_remarkController,textAlign:TextAlign.left),
                            SizedBox(height: 20.rpx,),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(S.of(context).uploadOrderResult,style: TextStyle(color:Color(0xff666666),fontSize: 30.rpx),textAlign:TextAlign.left),
                                  UploadPictureWidget(
                                    list: List.generate(7, (index) => ImageHelper.img),
                                    callback: (){
                                      print('callback');
                                    },
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ),
              ThemeButton(
                  title: S.of(context).submitOrderResult,
                  onPressed:(){
                    Navigator.of(context).pushNamed(RouteName.myOrderList,arguments: [0]);
                  }
              )
            ],
          ),
        ),
      ),
    );
  }

}
