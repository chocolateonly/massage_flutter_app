import 'package:flutter/material.dart';
import 'package:massageflutterapp/config/router_manager.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/ui/pages/login/login.dart';
import 'package:massageflutterapp/utils/size_fit.dart';
import 'package:massageflutterapp/ui/widges/button/theme_button.dart';
class SettingsPage extends StatefulWidget {

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(S.of(context).settings),
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
                width: double.maxFinite,
                child: Card(
                  margin: EdgeInsets.all(20.rpx),
                  shape:  RoundedRectangleBorder(borderRadius:BorderRadius.circular(20.rpx)),
                  child: Container(
                      padding:EdgeInsets.all(20.rpx),
                      child: Column(
                        children: <Widget>[
                          Item(S.of(context).aboutUs,0),
                          Item(S.of(context).agreement1,1),
                          Item(S.of(context).agreement2,2),
                          Item(S.of(context).changePassword,3),
                        ],
                      )
                  ),
                ),
              ),
              ThemeButton(
                  title: S.of(context).loginOut,
                  onPressed:(){
                    //todo:处理表单
                    Navigator.pushAndRemoveUntil(context, new MaterialPageRoute(builder: (context) => LoginPage()), (route) => route == null);
                  }
              )
            ],
          ),
        ),
      ),
    );
  }

  Container Item(text,index) {
    return Container(
                           decoration: BoxDecoration(
                               border: Border(
                                   bottom:index!=3? BorderSide(color: Color(0xffeeeeee)):BorderSide(color: Colors.transparent)
                               )
                           ),
                           child: InkWell(
                             onTap: (){
                               //todo
                               switch(index){
                                 case 0:Navigator.of(context).pushNamed(RouteName.agreementFile,arguments: [0,text]);
                                 return;
                                 case 1:Navigator.of(context).pushNamed(RouteName.agreementFile,arguments: [1,text]);
                                 return;
                                 case 2:Navigator.of(context).pushNamed(RouteName.agreementFile,arguments: [2,text]);
                                 return;
                                 case 3:Navigator.of(context).pushNamed(RouteName.forgetPassword,arguments: [3]);
                                 return;
                               }
                             },
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: <Widget>[
                                 Container(
                                   padding:EdgeInsets.symmetric(vertical: 20.rpx),
                                   child:Text(text,style: TextStyle(color: Color(0xff666666))),
                                 ),
                                Icon( Icons.arrow_forward_ios,color: Color(0xff999999),size: 16,)
                               ],
                             ),
                           ),
                         );
  }
}
