import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:massageflutterapp/utils/size_fit.dart';
import 'package:massageflutterapp/config/resouce_manager.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/view_model/user_model.dart';
import 'package:provider/provider.dart';
class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    var userModel=Provider.of<UserModel>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
//            top-----
            Container(
              height: 380.rpx,
              color: Theme.of(context).accentColor,
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(55.rpx),
                            child: Image.asset(userModel.userInfo.headpic,width:110.rpx,height:110.rpx),
                          ),
                          SizedBox(width: 10.rpx,),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child:Text(userModel.userInfo.nickname,style: TextStyle(color: Colors.white,fontSize: 36.rpx,),overflow: TextOverflow.ellipsis,),
                                    ),
                                    Image.asset(ImageHelper.wrapAssets('mine_set.png'),width:44.rpx,height:44.rpx),
                                  ],
                                ),
                                SizedBox(height: 10.rpx,),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child:Text(userModel.userInfo.username,style: TextStyle(color: Colors.white,fontSize: 30.rpx),overflow: TextOverflow.ellipsis),
                                    ),
                                    Text(S.of(context).edit,style: TextStyle(color: Colors.white,fontSize: 26.rpx)),
                                    Icon(Icons.arrow_forward_ios,color: Colors.white,size: 26.rpx,)
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
//                      todo:跳转到套餐页面
                    },
                    child: Container(
                      height: 90.rpx,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xff6A3B08), Color(0xffC7A163)],
                        ),
                        borderRadius: BorderRadius.vertical(top: Radius.circular(10))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Row(
                              children: <Widget>[
                                Image.asset(ImageHelper.wrapAssets('mine_meal.png'),width:38.rpx,height:38.rpx),
                                SizedBox(width:10.rpx),
                                Text(S.of(context).hasBuyCombo,style: TextStyle(color: Colors.white,fontSize: 30.rpx),),
                              ],
                            ),
                          ),
                          Text(S.of(context).viewNow,style: TextStyle(color: Colors.white,fontSize: 30.rpx)),
                          Icon(Icons.arrow_forward_ios,color: Colors.white,size: 32.rpx,)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
//            我的订单
          Card(
            margin: EdgeInsets.all(20.rpx),
            shape:  RoundedRectangleBorder(borderRadius:BorderRadius.circular(20.rpx)),
            child:Column(
              children: <Widget>[
                Padding(
                  padding:EdgeInsets.only(bottom: 10.rpx),
                  child: Text(S.of(context).myOrder,style:TextStyle(fontWeight: FontWeight.bold,fontSize: 30.rpx,color:Color(0xff333333))),
                ),

              ],
            )
          )
          ],
        )
      ),
    );
  }
}
