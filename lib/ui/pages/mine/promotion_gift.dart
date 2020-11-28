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
                            text: S.of(context).shareFriend,
                            style: TextStyle(fontSize: 32.rpx, color: Color(0xff333333)),
                            children: <TextSpan>[
                              TextSpan(
                                text: S.of(context).priceUnit+'30',
                                style: TextStyle(fontSize: 32.rpx, color: Color(0xffC49C5F)),),
                              TextSpan(
                                text: S.of(context).shareFriendTip1,
                                style: TextStyle(fontSize: 32.rpx, color: Color(0xff333333)),),
                            ]),
                        textAlign: TextAlign.center),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child:RichText(
                        text: TextSpan(
                            text: S.of(context).shareFriendTip2,
                            style: TextStyle(fontSize: 40.rpx, color: Color(0xff333333)),
                            children: <TextSpan>[
                              TextSpan(
                                text: S.of(context).priceUnit+'30',
                                style: TextStyle(fontSize: 40.rpx, color: Color(0xffFF6C3C)),),
                              TextSpan(
                                text: S.of(context).shareFriendTip3,
                                style: TextStyle(fontSize: 40.rpx, color: Color(0xff333333)),),
                            ]),
                        textAlign: TextAlign.center),
                  ),
                 Container(
                   padding: EdgeInsets.symmetric(vertical: 10),
                   child:InkWell(
                       onTap: (){
                         Navigator.of(context).pushNamed(RouteName.applyWord,arguments: [S.of(context).rewardRule,3]);
                       },
                       child: Text(S.of(context).rewardRule, style: TextStyle(color:Color(0xffC49C5F), fontSize: 24.rpx),textAlign: TextAlign.center,)
                   ),
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
                          child: Text(S.of(context).shareFriend, style: TextStyle(color:Colors.white, fontSize: 34.rpx),textAlign: TextAlign.center,),
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
                          child: Text(S.of(context).myCoupons,
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
