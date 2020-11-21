import 'package:flutter/material.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/utils/size_fit.dart';
import 'package:massageflutterapp/ui/widgets/button/theme_button.dart';
import 'package:massageflutterapp/ui/widgets/form/radio_list.dart';
class ApplicationFormPage extends StatefulWidget {

  @override
  _ApplicationFormPageState createState() => _ApplicationFormPageState();
}

class _ApplicationFormPageState extends State<ApplicationFormPage> {
  var massagist=0;
  var massagistList=[
    '男按摩师',
    '女按摩师',
    '月嫂',
    '男按摩师',
    '女按摩师',
    '月嫂',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      appBar: AppBar(
        centerTitle: true,
        title: Text(S.of(context).applicationForm),
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
                      child:Column(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Color(0xffeeeeee))
                                )
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                               /* Container(
                                  width:100.rpx,
                                  child:  Text(S.of(context).sex,style: TextStyle(color: Color(0xff666666)),),
                                ),*/
                                Container(
                                  width:double.maxFinite,
                                  child: RadioList(
                                      options: massagistList,selected: massagist,isRow: true,
                                      height:90.rpx,
                                      crossAxisCount:3,
                                      childAspectRatio:1.7,
                                      onChange:(i){
                                        setState(() {
                                          massagist =i;
                                        });
                                      }
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                  ),
                ),
              ),
              ThemeButton(
                  title: S.of(context).submit,
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
