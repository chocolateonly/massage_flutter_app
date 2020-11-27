import 'package:flutter/material.dart';
import 'package:massageflutterapp/config/router_manager.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/utils/size_fit.dart';
import 'package:massageflutterapp/ui/widgets/button/theme_button.dart';

import 'package:massageflutterapp/config/resouce_manager.dart';
class MyEarningsPage extends StatefulWidget {

  @override
  _MyEarningsPageState createState() => _MyEarningsPageState();
}

class _MyEarningsPageState extends State<MyEarningsPage> {
  var inputController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    var all_balance=S.of(context).allEarnings;
    var wait_balance=S.of(context).canExchangeEarnings;
    var record=S.of(context).exchangeRecord;
    var inputMoneyPlaceholder=S.of(context).inputWillExchangeNumber;
    var canGetMoney=S.of(context).canGetMoney;
    var selectAccount=S.of(context).pleaseSelectAccount;
    var submit=S.of(context).exchangeCash;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(S.of(context).myEarnings),
        actions: <Widget>[
           InkWell(
             onTap: (){
              //
               Navigator.of(context).pushNamed(RouteName.exchangeRecordPage);
             },
               child: Center(child: Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: Text(record),
               )))
        ],
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
                width:double.maxFinite,
                height: 335.rpx,
                decoration: BoxDecoration(
//                背景图
                  image: new DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(ImageHelper.wrapAssets('my_earings_bg.png')),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(all_balance,style: TextStyle(color: Colors.white,fontSize: 34.rpx),),
                          Text('453453',style: TextStyle(color: Colors.white,fontSize: 50.rpx),overflow: TextOverflow.ellipsis,),
                        ],
                      ),
                    ),
                    Container(
                      width:2.rpx,
                      height: 100.rpx,
                      color:Colors.white
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(wait_balance,style: TextStyle(color: Colors.white,fontSize: 34.rpx),),
                          Text('453453',style: TextStyle(color: Colors.white,fontSize: 50.rpx),overflow: TextOverflow.ellipsis,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.maxFinite,
                child: Card(
                  margin: EdgeInsets.all(20.rpx),
                  shape:  RoundedRectangleBorder(borderRadius:BorderRadius.circular(20.rpx)),
                  child: Container(
                      padding:EdgeInsets.all(20.rpx),
                      child:Container(
                        child: Column(
                          children: <Widget>[
                        Container(
                         decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(color: Color(0xffeeeeee)))),
                         child: TextField(
                           controller: inputController,
                           style: TextStyle(color:Color(0xff999999) ),
                           keyboardType:TextInputType.number,
                           decoration: InputDecoration(
                               border: InputBorder.none,
                             hintText: inputMoneyPlaceholder
                           ),
                         ),
                        ),
                          Row(
                            children: <Widget>[
                              Text(canGetMoney,
                                style: TextStyle(color: Color(0xff999999),fontSize: 30.rpx),overflow: TextOverflow.ellipsis,),
                              SizedBox(width: 10.rpx,),
                              Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 20.rpx),
                                    child: Text(S.of(context).priceUnit+'453453',
                                      style: TextStyle(color: Color(0xffFF0000),fontSize: 34.rpx),overflow: TextOverflow.ellipsis,),
                                  )),

                            ],
                          )
                          ],
                        ),
                      )
                  ),
                ),
              ),
              Container(
                width: double.maxFinite,
                child: Card(
                  margin: EdgeInsets.all(20.rpx),
                  shape:  RoundedRectangleBorder(borderRadius:BorderRadius.circular(20.rpx)),
                  child: Container(
                      padding:EdgeInsets.all(20.rpx),
                      child:InkWell(
                        onTap: (){
                           Navigator.of(context).pushNamed(RouteName.myAccount);
                        },
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                padding:EdgeInsets.symmetric(vertical: 20.rpx),
                                child:Text(selectAccount,style: TextStyle(color: Color(0xff666666)),overflow: TextOverflow.ellipsis,),
                              ),
                            ),
                            Icon( Icons.arrow_forward_ios,color: Color(0xff999999),size: 16,)
                          ],
                        ),
                      )
                  ),
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
      ),
    );
  }
}
