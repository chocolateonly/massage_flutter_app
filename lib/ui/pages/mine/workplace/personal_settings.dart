import 'package:flutter/material.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/utils/size_fit.dart';
import 'package:massageflutterapp/ui/widgets/button/theme_button.dart';
import 'package:massageflutterapp/config/router_manager.dart';
import 'package:massageflutterapp/ui/widgets/form/form_item.dart';

import 'package:massageflutterapp/config/resouce_manager.dart';
import 'package:massageflutterapp/ui/widgets/upload_picture_widget.dart';
class PersonalSettingsPage extends StatefulWidget {

  @override
  _PersonalSettingsPageState createState() => _PersonalSettingsPageState();
}

class _PersonalSettingsPageState extends State<PersonalSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('个人设置'),
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
                              child:Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.rpx),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,//自动撑高
                                  children: <Widget>[
                                    Container(
                                      width:double.maxFinite,
                                      padding: EdgeInsets.all(40.rpx),
                                      decoration: BoxDecoration(
                                          color: Theme.of(context).accentColor
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(Icons.check_circle,color: Theme.of(context).accentColor,size: 50.rpx,),
                                          Text(S.of(context).tipTile,style: TextStyle(color: Colors.white,fontSize: 30.rpx),)
                                        ],
                                      ) ,
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(40.rpx),
                                      child:  Text('资料提交成功， 结果将在1-2工作日反馈！',
                                        style: TextStyle(color: Color(0xff4d4d4d),fontSize: 32.rpx),textAlign: TextAlign.center,),
                                    ),
                                    Container(
                                      width: 480.rpx,
                                      child: ThemeButton(
                                        title:'我知道了',
                                        onPressed: (){
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              )
                          );
                        }
                    );
                  }
              ),
              SizedBox(height: 20.rpx,)
            ],
          ),
        ),
      ),
    );
  }
}
