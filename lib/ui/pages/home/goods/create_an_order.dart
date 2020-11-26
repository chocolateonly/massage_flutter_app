import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/utils/size_fit.dart';
import 'package:massageflutterapp/ui/widgets/button/theme_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:massageflutterapp/config/resouce_manager.dart';
import 'package:massageflutterapp/config/router_manager.dart';
import 'package:massageflutterapp/ui/widgets/form/form_item.dart';

class CreateAnOrderPage extends StatefulWidget {
  CreateAnOrderPage(id);


  @override
  _CreateAnOrderPageState createState() => _CreateAnOrderPageState();
}

class _CreateAnOrderPageState extends State<CreateAnOrderPage> {
  var _remarkController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('确认订单'),
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
                                  Text('挥洒法华寺东方航空史蒂芬霍金看到的非官方定',style: TextStyle(color:Color(0xff999999),fontSize: 24.rpx),textAlign: TextAlign.left,overflow: TextOverflow.ellipsis,),

                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                      child:Row(
                                        children: <Widget>[
                                          Text(S.of(context).priceUnit,style:TextStyle(color: Color(0xff333333),fontSize: 30.rpx),),
                                          Text('76778',style:TextStyle(color: Color(0xff333333),fontSize: 30.rpx),),
                                        ],
                                      ),
                                  ),
                                      Text('x1',style: TextStyle(color:Color(0xff999999),fontSize: 24.rpx),textAlign: TextAlign.left,),
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
                            Container(
                              padding:EdgeInsets.symmetric(vertical: 20.rpx),
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Color(0xffeeeeee)))
                              ),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(S.of(context).numberOfCombo,style: TextStyle(color:Color(0xff333333),fontSize: 30.rpx)),
                                    SizedBox(width:10.rpx),
                                    Text('3454',style: TextStyle(color:Color(0xff666666),fontSize: 30.rpx)),
                                  ]
                              ),
                            ),

                            Container(
                              padding:EdgeInsets.symmetric(vertical: 20.rpx),
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Color(0xffeeeeee)))
                              ),
                              child: InkWell(
                                onTap: () {
                                  //选择优惠券
                                  Navigator.of(context).pushNamed(RouteName.myCoupons);
                                },
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            S.of(context).coupons,
                                            style: TextStyle(
                                                color: Color(0xff333333),
                                                fontSize: 30.rpx),
                                            textAlign: TextAlign.left,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(
                                            width: 10.rpx,
                                          ),
                                          Expanded(
                                            child: Text(
                                              S.of(context).pleaseSelect,
                                              style: TextStyle(
                                                  color: Color(0xff666666),
                                                  fontSize: 30.rpx),
                                              textAlign: TextAlign.right,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: Color(0xff999999),
                                      size: 16,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            FormItem(label:S.of(context).orderRemark,controller:_remarkController,textAlign:TextAlign.left,inputType:TextInputType.multiline,maxLines:null,textColor: 0xff333333,),
                            SizedBox(height: 20.rpx,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text(S.of(context).numberOfGoods(1),style: TextStyle(color: Color(0xff999999), fontSize: 24.rpx)),
                                SizedBox(width: 10.rpx,),
                                Text('${S.of(context).subtotal}：',style: TextStyle(color: Color(0xff000000), fontSize: 24.rpx)),
                                SizedBox(width: 10.rpx,),
                                Text(S.of(context).priceUnit+'36456',style: TextStyle(color: Color(0xffEC1C24), fontSize: 28.rpx)),
                              ],
                            )
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
                    Navigator.of(context).pushNamed(RouteName.uploadOrderResult,arguments: ['']);
                  }
              )
            ],
          ),
        ),
      ),
    );
  }

}
