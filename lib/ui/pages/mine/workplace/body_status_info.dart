import 'package:flutter/material.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/utils/size_fit.dart';
import 'package:massageflutterapp/ui/widgets/button/theme_button.dart';
import 'package:massageflutterapp/config/router_manager.dart';
import 'package:massageflutterapp/ui/widgets/form/form_item.dart';

import 'package:massageflutterapp/config/resouce_manager.dart';
import 'package:massageflutterapp/ui/widgets/upload_picture_widget.dart';
class BodyStatusInfoPage extends StatefulWidget {

  @override
  _BodyStatusInfoPageState createState() => _BodyStatusInfoPageState();
}

class _BodyStatusInfoPageState extends State<BodyStatusInfoPage> {
  var check=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(S.of(context).bodyStatus),
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
              Container(
                padding:EdgeInsets.all(20.rpx),
                child: InkWell(
                  onTap: (){
                    setState(() {
                      check = !check;
                    });
                  },
                  child: Row(
                    children: <Widget>[
                      Container(
                          child: checkIcon(),
                          padding:EdgeInsets.all(20.rpx)
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('本人郑重承诺',style: TextStyle(color: Color(0xff333333),fontSize: 30.rpx)),
                            Text('上述信息是我本人或他人代填写，本人对信息 内容真实性和完整性负责，因信息填报不实导 致相关后果的，本人愿承担相应责任',style: TextStyle(color: Color(0xff999999),fontSize: 26.rpx)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              ThemeButton(
                  title: S.of(context).submit,
                  onPressed:(){

                  }
              ),
              SizedBox(height: 20.rpx,)
            ],
          ),
        ),
      ),
    );
  }


  Widget checkIcon() {
    return InkWell(
      child: !check
          ? Icon(
        Icons.check_circle_outline,
        size: 20.px,
        color: Colors.grey,
      )
          : Icon(
        Icons.check_circle,
        size: 20.px,
        color: Theme.of(context).accentColor,
      ),
      onTap: () {
        setState(() {
          check = !check;
        });
      },
    );
  }
}


