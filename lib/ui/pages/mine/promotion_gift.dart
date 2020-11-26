import 'package:flutter/material.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/config/resouce_manager.dart';
import 'package:massageflutterapp/utils/size_fit.dart';
import 'package:massageflutterapp/ui/widgets/my_invite_code.dart';
import 'package:massageflutterapp/config/router_manager.dart';
class PromotionGiftPage extends StatefulWidget {

  @override
  _PromotionGiftPageState createState() => _PromotionGiftPageState();
}

class _PromotionGiftPageState extends State<PromotionGiftPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(S.of(context).promotionGift),
      ),
      body:Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child:  Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                    image: AssetImage(ImageHelper.wrapAssets('p_g_bg.png')))
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(height:30),
                  Image.asset(ImageHelper.wrapAssets('p_g_core.png'),width:690.rpx,height: 433.rpx,),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child:RichText(
                        text: TextSpan(
                            text: '分享好友',
                            style: TextStyle(fontSize: 32.rpx, color: Color(0xff333333)),
                            children: <TextSpan>[
                              TextSpan(
                                text: '30元',
                                style: TextStyle(fontSize: 32.rpx, color: Color(0xffC49C5F)),),
                              TextSpan(
                                text: '新人优惠券，当TA首次下单后',
                                style: TextStyle(fontSize: 32.rpx, color: Color(0xff333333)),),
                            ]),
                        textAlign: TextAlign.center),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child:RichText(
                        text: TextSpan(
                            text: '您可以获得',
                            style: TextStyle(fontSize: 40.rpx, color: Color(0xff333333)),
                            children: <TextSpan>[
                              TextSpan(
                                text: '30元',
                                style: TextStyle(fontSize: 40.rpx, color: Color(0xffFF6C3C)),),
                              TextSpan(
                                text: '奖励',
                                style: TextStyle(fontSize: 40.rpx, color: Color(0xff333333)),),
                            ]),
                        textAlign: TextAlign.center),
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                    child: InkWell(
                      onTap: (){
                        showDialog(
                          context:context,
                        barrierDismissible:true,//点击遮罩是否关闭
                        builder: (context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                              child:MyInviteCode()
                          );
                        }
                        );

                      },
                      child: Container(
                        width: double.maxFinite,
                        height: 92.rpx,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.rpx),
                            color: Theme.of(context).accentColor,
                            border: Border.all(color:Colors.transparent, width: 1)),
                        child: Center(
                          child: Text('邀请好友',
                            style: TextStyle(color:Colors.white, fontSize: 34.rpx),textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                    child: InkWell(
                      onTap: (){
                        Navigator.of(context).pushNamed(RouteName.myCoupons);
                      },
                      child: Container(
                        width: double.maxFinite,
                        height: 92.rpx,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.rpx),
                            border: Border.all(color:Theme.of(context).accentColor, width: 1)),
                        child: Center(
                          child: Text('我的优惠券',
                            style: TextStyle(color:Theme.of(context).accentColor, fontSize: 34.rpx),textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          )
        ],
      )
    );
  }
}
