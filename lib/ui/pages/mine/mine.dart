import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:massageflutterapp/utils/size_fit.dart';
import 'package:massageflutterapp/config/resouce_manager.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/view_model/user_model.dart';
import 'package:provider/provider.dart';
import 'package:massageflutterapp/config/router_manager.dart';
class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    var userModel=Provider.of<UserModel>(context);
    _titleList=[
      S.of(context).myPoint,
      S.of(context).healthyInfo,
      S.of(context).myEarnings,
      S.of(context).myOrganization,
      S.of(context).myComments,
      S.of(context).myAddress,
      S.of(context).myCollection,
      S.of(context).workPlatform
    ];

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
                    child: InkWell(
                      onTap: (){
                        Navigator.of(context).pushNamed(RouteName.myInfo);
                      },
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
                                      InkWell(
                                        onTap: (){
                                          Navigator.of(context).pushNamed(RouteName.settings);
                                        },
                                          child: Image.asset(ImageHelper.wrapAssets('mine_set.png'),width:44.rpx,height:44.rpx)),
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
                  ),
                  InkWell(
                    onTap: (){
//                     跳转到套餐页面
                    Navigator.of(context).pushNamed(RouteName.myCombo);
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
           SizedBox(height:20.rpx),
          //            我的订单
          Container(
            width:double.maxFinite,
            child: Card(
              margin: EdgeInsets.all(20.rpx),
              shape:  RoundedRectangleBorder(borderRadius:BorderRadius.circular(10.rpx)),
              child:Container(
                padding:EdgeInsets.all(20.rpx),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding:EdgeInsets.only(bottom: 20.rpx),
                      width: double.maxFinite,
                      child: Text(S.of(context).myOrder,
                          style:TextStyle(fontWeight: FontWeight.bold,fontSize: 30.rpx,color:Color(0xff333333)),textAlign: TextAlign.left,),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        gridItem(S.of(context).orderStatus1,'mine_order1.png',0),
                        gridItem(S.of(context).orderStatus2,'mine_order2.png',1),
                        gridItem(S.of(context).orderStatus3,'mine_order3.png',2),
                        gridItem(S.of(context).orderStatus4,'mine_order4.png',3),
                      ],
                    ),
                  ],
                ),
              )
            ),
          ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                  TwoRowItem(S.of(context).applicationForm,'mine_form.png',0),
                  TwoRowItem(S.of(context).promotionGift,'mine_gift.png',1),
              ],
            ),
            //            我的服务
            Container(
              width:double.maxFinite,
              child: Card(
                  margin: EdgeInsets.all(20.rpx),
                  shape:  RoundedRectangleBorder(borderRadius:BorderRadius.circular(10.rpx)),
                  child:Container(
                    padding:EdgeInsets.all(20.rpx),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding:EdgeInsets.only(bottom: 20.rpx),
                          width: double.maxFinite,
                          child: Text(S.of(context).myService,
                            style:TextStyle(fontWeight: FontWeight.bold,fontSize: 30.rpx,color:Color(0xff333333)),textAlign: TextAlign.left,),
                        ),
                        Container(
                          height: 320.rpx,
                          child: GridView.builder(
                              physics: new NeverScrollableScrollPhysics(),		//禁用滑动事件
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, childAspectRatio: 1.2),
                              itemCount: _titleList.length,
                              itemBuilder: (context, index) {
                                return gridItem2(_titleList[index], _imgList[index], index);
                              }),
                        ),
                      ],
                    ),
                  )
              ),
            ),
          ],
        )
      ),
    );
  }
  Widget gridItem(text, src, index) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(RouteName.myOrderList, arguments: [index]);
      },
      child: Column(
        children: <Widget>[
          Image.asset(
            ImageHelper.wrapAssets(src),
            width: 25.px,
            height: 25.px,
          ),
          SizedBox(height: 6.px),
          Container(
              width: 140.rpx,
              child: Text(text,
                  style: TextStyle(color:Color(0xff6D3E0B), fontSize: 14.px), maxLines: 1, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center)),
        ],
      ),
    );
  }

  Card TwoRowItem(text,img_path,index) {
    return Card(
    margin: EdgeInsets.all(20.rpx),
    shape:  RoundedRectangleBorder(borderRadius:BorderRadius.circular(10.rpx)),
    child:InkWell(
      onTap: (){
        switch(index){
          case 0: Navigator.of(context).pushNamed(RouteName.applicationForm); //跳转应聘表格
          return;
          case 1: Navigator.of(context).pushNamed(RouteName.promotionGift); //跳转推广好礼
          return;
          default:Navigator.of(context).pushNamed(RouteName.applicationForm);
        }
      },
      child: Container(
        width: 335.rpx,
        height: 110.rpx,
            padding:EdgeInsets.all(20.rpx),
        child: Row(
          children: <Widget>[
            Image.asset(ImageHelper.wrapAssets(img_path),width:70.rpx,height:70.rpx),
            Padding(
              padding: EdgeInsets.only(left: 20.rpx),
              child: Text(text,style: TextStyle(color: Color(0xff6D3E0B),fontSize: 28.rpx),),
            )
          ],
        ),
            ),
    )
    );
  }

  List<String> _titleList;

  List<String> _imgList = ["mine_service1.png", "mine_service2.png", "mine_service3.png", "mine_service4.png", "mine_service5.png", "mine_service6.png", "mine_service7.png", "mine_service8.png"];

  Widget gridItem2(text, src, index) {
    return InkWell(
      onTap: () {
        switch (index) {
          case 0:
            Navigator.of(context).pushNamed(RouteName.myPoint);
            break;
          case 1:
            Navigator.of(context).pushNamed(RouteName.healthyInfo);
            break;
          case 2:
            Navigator.of(context).pushNamed(RouteName.myEarnings);
            break;
          case 3:
            Navigator.of(context).pushNamed(RouteName.myOrganization);
            break;
          case 4:
            Navigator.of(context).pushNamed(RouteName.myComments);
            break;
          case 5:
            Navigator.of(context).pushNamed(RouteName.myAddress);
            break;
          case 6:
            Navigator.of(context).pushNamed(RouteName.myCollection);
            break;
          case 7:
            Navigator.of(context).pushNamed(RouteName.workPlatform);
            break;
        }
      },
      child: Column(
        children: <Widget>[
          Image.asset(
            ImageHelper.wrapAssets(src),
            width: 25.px,
            height: 25.px,
          ),
          SizedBox(height: 6.px),
          Text(text, style: TextStyle(color: Color(0xff6D3E0B), fontSize: 14.px), maxLines: 1, overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }
}
