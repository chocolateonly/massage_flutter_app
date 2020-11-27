import 'package:flutter/material.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/utils/size_fit.dart';
import 'package:massageflutterapp/ui/widgets/button/theme_button.dart';

import 'package:massageflutterapp/config/resouce_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
class PointResultPage extends StatefulWidget {

  @override
  _PointResultPageState createState() => _PointResultPageState();
}

class _PointResultPageState extends State<PointResultPage> {
  @override
  Widget build(BuildContext context) {
    var title=S.of(context).pointChangeResult;
    var reciverName=S.of(context).receiver;
    var reciverAddress=S.of(context).receiverAddress;
    var usedPoint=S.of(context).memberPoint;
    var createdTime=S.of(context).exchangeTime;
    var changeOrderNumber=S.of(context).exchangeOrderNumber;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap:  (){
          //点击输入框以外的地方  收起键盘
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 200.rpx,
                  child: Image.asset(ImageHelper.wrapAssets('my_point_result_success.png'),width: 270.rpx,height:67.rpx,)
              ),
              Container(
                width: double.maxFinite,
                child: Card(
                  margin: EdgeInsets.all(20.rpx),
                  shape:  RoundedRectangleBorder(borderRadius:BorderRadius.circular(20.rpx)),
                  child:Container(

                    padding:  EdgeInsets.all(20.rpx),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding:EdgeInsets.symmetric(vertical: 20.rpx),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(reciverName,style: TextStyle(color:Color(0xff666666),fontSize: 26.rpx)),
                                SizedBox(width:10.rpx),
                                Expanded(
                                    child: Text(S.of(context).serviceTime,
                                      style: TextStyle(color:Color(0xff333333),fontSize: 26.rpx),overflow: TextOverflow.ellipsis,)),
                              ]
                          ),
                        ),
                        Container(
                          padding:EdgeInsets.symmetric(vertical: 20.rpx),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(reciverAddress,style: TextStyle(color:Color(0xff666666),fontSize: 26.rpx)),
                                SizedBox(width:10.rpx),
                                Expanded(
                                    child: Text(S.of(context).serviceTime,
                                      style: TextStyle(color:Color(0xff333333),fontSize: 26.rpx),maxLines: null,)),
                              ]
                          ),
                        ),
                        //                    商品
                        Row(
                          children: <Widget>[
                            Container(
                                padding: EdgeInsets.only(right: 20.rpx),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3)),
                                child: CachedNetworkImage(
                                    height: 104.rpx,
                                    width: 104.rpx,
                                    imageUrl: ImageHelper.wrapUrl(ImageHelper.img),
                                    placeholder: (context, url) => Center(child: CupertinoActivityIndicator()),
                                    errorWidget: (context, url, error) => Icon(Icons.error))
                            ),
                            Expanded(
                              child: Container(
                                height: 104.rpx,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('3天经期全面调理 拷贝',style: TextStyle(color:Color(0xff333333),fontSize: 30.rpx),textAlign: TextAlign.left,overflow: TextOverflow.ellipsis,),
                                    Text('76778'+S.of(context).point,style:TextStyle(color: Color(0xff333333),fontSize: 30.rpx),),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        Container(
                          padding:EdgeInsets.symmetric(vertical: 20.rpx),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(usedPoint,style: TextStyle(color:Color(0xff666666),fontSize: 26.rpx)),
                                SizedBox(width:10.rpx),
                                Expanded(
                                    child: Text(S.of(context).serviceTime,
                                      style: TextStyle(color:Color(0xff666666),fontSize: 26.rpx),overflow: TextOverflow.ellipsis,textAlign: TextAlign.right,)),
                              ]
                          ),
                        ),
                        Container(
                          padding:EdgeInsets.symmetric(vertical: 20.rpx),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(createdTime,style: TextStyle(color:Color(0xff666666),fontSize: 26.rpx)),
                                SizedBox(width:10.rpx),
                                Expanded(
                                    child: Text(S.of(context).serviceTime,
                                      style: TextStyle(color:Color(0xff666666),fontSize: 26.rpx),overflow: TextOverflow.ellipsis,textAlign: TextAlign.right,)),
                              ]
                          ),
                        ),
                        Container(
                          padding:EdgeInsets.symmetric(vertical: 20.rpx),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(changeOrderNumber,style: TextStyle(color:Color(0xff666666),fontSize: 26.rpx)),
                                SizedBox(width:10.rpx),
                                Expanded(
                                    child: Text(S.of(context).serviceTime,
                                      style: TextStyle(color:Color(0xff666666),fontSize: 26.rpx),overflow: TextOverflow.ellipsis,textAlign: TextAlign.right,)),
                              ]
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              ThemeButton(
                  title: S.of(context).contact,
                  onPressed:(){
                    launch("tel://18727275857");
                  }
              )
            ],
          ),
        ),
      ),
    );
  }
}
