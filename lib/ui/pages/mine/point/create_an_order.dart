import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/utils/size_fit.dart';
import 'package:massageflutterapp/ui/widgets/button/theme_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:massageflutterapp/config/resouce_manager.dart';
import 'package:massageflutterapp/config/router_manager.dart';
import 'package:massageflutterapp/ui/widgets/form/form_item.dart';

class CreateAnPointOrderPage extends StatefulWidget {
  CreateAnPointOrderPage(id);


  @override
  _CreateAnPointOrderPageState createState() => _CreateAnPointOrderPageState();
}

class _CreateAnPointOrderPageState extends State<CreateAnPointOrderPage> {
  var _remarkController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(S.of(context).confirmOrder),
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
                height: 200.rpx,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.rpx),
                ),
                child:Padding(
                  padding:  EdgeInsets.all(20.rpx),
                  child: InkWell(
                    onTap: (){
                      //去选择地址
                      Navigator.of(context).pushNamed(RouteName.myAddress);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            SizedBox(width:43.rpx),
                            ConstrainedBox(
                                constraints:BoxConstraints(maxWidth: 200.rpx),
                                child: Text('上端上端:',style: TextStyle(color: Color(0xff333333),fontSize: 34.rpx),overflow: TextOverflow.ellipsis,)),
                            SizedBox(width:10.rpx),
                            Expanded(child: Text('234245432',style: TextStyle(color: Color(0xff666666),fontSize: 34.rpx),overflow: TextOverflow.ellipsis,))
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Image.asset(ImageHelper.wrapAssets('icon_address.png'),width: 33.rpx,height: 36.rpx,),
                            SizedBox(width:10.rpx),
                            Expanded(child: Text('湖北省襄阳市樊城区万达小区',style: TextStyle(color: Color(0xff333333),fontSize: 30.rpx),overflow: TextOverflow.ellipsis,)),
                              Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xff999999),
                              size: 16,
                            )
                          ],
                        ),
                      ],
                    ),
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
                      //商品
                      Row(
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.only(right: 20.rpx),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3)),
                              child: CachedNetworkImage(
                                  height: 150.rpx,
                                  width:  150.rpx,
                                  imageUrl: ImageHelper.wrapUrl(ImageHelper.img),
                                  placeholder: (context, url) => Center(child: CupertinoActivityIndicator()),
                                  errorWidget: (context, url, error) => Icon(Icons.error))
                          ),
                          Expanded(
                            child: Container(
                              height: 150.rpx,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('3天经期全面调理 拷贝',style: TextStyle(color:Color(0xff333333),fontSize: 30.rpx),textAlign: TextAlign.left,overflow: TextOverflow.ellipsis,),

                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                      child:Row(
                                        children: <Widget>[
                                         Text('76778'+S.of(context).point,style:TextStyle(color: Color(0xff333333),fontSize: 30.rpx),),
                                        ],
                                      ),
                                  ),
                                    ],
                                  ),

                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      //
                      Container(
                        margin:EdgeInsets.only(top: 20.rpx,left:20.rpx,right:20.rpx),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.rpx),
                        ),
                        child: Column(
                          children: <Widget>[
                            FormItem(label:S.of(context).remark,controller:_remarkController,textAlign:TextAlign.left,inputType:TextInputType.multiline,maxLines:null,textColor: 0xff333333,),

                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ),
              ThemeButton(
                  title: S.of(context).submitOrder,
                  onPressed:(){
                    Navigator.of(context).pushNamed(RouteName.pointResult,arguments: ['']);
                  }
              )
            ],
          ),
        ),
      ),
    );
  }

}
