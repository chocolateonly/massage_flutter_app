import 'package:flutter/material.dart';
import 'package:massageflutterapp/config/resouce_manager.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/utils/size_fit.dart';
class MassagistLevelPage extends StatefulWidget {
  @override
  _MassagistLevelPageState createState() => _MassagistLevelPageState();
}

class _MassagistLevelPageState extends State<MassagistLevelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(S.of(context).massagistLevel),
        ),
        body:SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical:20.rpx),
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width:238.rpx,
                      height: 195.rpx,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(ImageHelper.wrapAssets('level_avatar_bg.png'))
                        )
                      ),
                      child: Column(
                        children: <Widget>[
                          ClipRRect(
                              borderRadius: BorderRadius.circular(75.rpx),
                              child: Image.network(ImageHelper.img,width: 150.rpx,height: 150.rpx,)),
                          Text(S.of(context).levelAbb+'.3',style: TextStyle(color: Colors.white,fontSize: 24.rpx),)
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(S.of(context).massagistScore+':3454',style: TextStyle(color: Color(0xff333333),fontSize: 24.rpx),),
                        SizedBox(width: 20.rpx,),
                        Text(S.of(context).nextLevel+':3454',style: TextStyle(color: Color(0xff333333),fontSize: 24.rpx),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(S.of(context).levelAbb+'.3',style: TextStyle(color: Theme.of(context).accentColor,fontSize: 24.rpx),),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 6.rpx),
                            width:376.rpx,
                            clipBehavior:  Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.rpx)
                            ),
                            child: LinearProgressIndicator(backgroundColor: Color(0xffe6e6e6),value: 0.5,valueColor:AlwaysStoppedAnimation<Color>(Theme.of(context).accentColor),)),
                        Text(S.of(context).levelAbb+'.4',style: TextStyle(color: Theme.of(context).accentColor,fontSize: 24.rpx),),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top:20.rpx),
                padding: EdgeInsets.all(20.rpx),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(S.of(context).levelPriority,style: TextStyle(color: Color(0xff333333),fontSize: 30.rpx),),
                    Text('1.这里是规则说明内容详情这里是规则说明内容详情这里是规则说明内容详情这里是规则说明内容详情。 2.这里是规则说明内容详情这里',
                      style: TextStyle(color: Color(0xff666666),fontSize: 24.rpx),maxLines: null,),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top:20.rpx),
                padding: EdgeInsets.all(20.rpx),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(S.of(context).upLevelRule,style: TextStyle(color: Color(0xff333333),fontSize: 30.rpx),),
                    Text('1.这里是规则说明内容详情这里是规则说明内容详情这里是规则说明内容详情这里是规则说明内容详情。 2.这里是规则说明内容详情这里',
                      style: TextStyle(color: Color(0xff666666),fontSize: 24.rpx),maxLines: null,),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}
