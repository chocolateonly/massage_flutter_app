import 'package:flutter/material.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/utils/size_fit.dart';
import 'package:massageflutterapp/ui/widgets/button/theme_button.dart';
import 'package:massageflutterapp/config/router_manager.dart';

import 'package:massageflutterapp/ui/widgets/form_finish_tip.dart';
class HealthyInfoPage extends StatefulWidget {

  @override
  _HealthyInfoPageState createState() => _HealthyInfoPageState();
}

class _HealthyInfoPageState extends State<HealthyInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(S.of(context).healthyInfo),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap:  (){
          //点击输入框以外的地方  收起键盘
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top:20.rpx,left: 20.rpx,right:20.rpx),
                child: Text('Personal Information',style: TextStyle(color: Theme.of(context).accentColor,fontSize: 30.rpx),textAlign: TextAlign.left,),
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
//表单项
                          ],
                        ),
                      )
                  ),
                ),
              ),
              ThemeButton(
                  title: S.of(context).submit,
                  onPressed:(){
                    showDialog(
                        context:context,
                        barrierDismissible:true,//点击遮罩是否关闭
                        builder: (context) {
                          return Dialog(
                              clipBehavior: Clip.antiAlias,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10.rpx))
                              ),
                              child:FormFinishTip()
                          );
                        }
                    );
                  }
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(S.of(context).bottomTip,style: TextStyle(color: Color(0xff999999),fontSize: 26.rpx)),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).pushNamed(RouteName.applyWord,arguments: [S.of(context).healthBottomWord,2]);
                    },
                    child: Text(S.of(context).healthBottomWord,style: TextStyle(color:Theme.of(context).accentColor,fontSize: 26.rpx),),
                  ),
                ],
              ),
              SizedBox(height: 20.rpx,)
            ],
          ),
        ),
      ),
    );
  }
}
