import 'package:flutter/material.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/utils/size_fit.dart';
import 'package:massageflutterapp/ui/widgets/button/theme_button.dart';
import 'package:massageflutterapp/ui/widgets/form/form_item.dart';

import 'package:massageflutterapp/ui/widgets/upload_picture_widget.dart';
class ApplicationFormPage extends StatefulWidget {

  @override
  _ApplicationFormPageState createState() => _ApplicationFormPageState();
}

class _ApplicationFormPageState extends State<ApplicationFormPage> {
  var massagist=0;
  var massagistList=[
    '男按摩师',
    '女按摩师',
    '月嫂'
  ];
  var _nameController=TextEditingController();
  var _mobileController=TextEditingController();
  var _addressController=TextEditingController();
  var _experienceController=TextEditingController();
  var abilityCertificate=[];
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
                          //按摩师类型
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 20.rpx),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Color(0xffeeeeee))
                                )
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width:150.rpx,
                                  child: Row(
                                    children: <Widget>[Text("*",style: TextStyle(color: Colors.red),), Text(S.of(context).type,style: TextStyle(color: Color(0xff333333),fontSize: 30.rpx),)
                                    ],
                                  ),
                                ),
                                ListView.builder( //遍历对应v-for
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: massagistList.length,
                                  itemBuilder: (context,index){
                                    return Column(
                                      children: <Widget>[
                                        RadioListTile(
                                          value: index,
                                          title: Text(massagistList[index]),
                                          groupValue: massagist,
                                          onChanged: (index) {
                                            setState(() {
                                              print(index);
                                              massagist = index;
                                            });
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          FormItem(label:S.of(context).name,controller:_nameController,isRequired:true,textColor:0xff333333),
                          FormItem(label:S.of(context).mobile,controller:_mobileController,isRequired:true,textColor:0xff333333),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 20.rpx),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Color(0xffeeeeee))
                                )
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width:150.rpx,
                                  child: Row(
                                    children: <Widget>[Text("*",style: TextStyle(color: Colors.red),), Text(S.of(context).serviceProject,style: TextStyle(color: Color(0xff333333),fontSize: 30.rpx),)
                                    ],
                                  ),
                                ),
                                ListView.builder( //遍历对应v-for
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: massagistList.length,
                                  itemBuilder: (context,index){
                                    return Column(
                                      children: <Widget>[
                                        RadioListTile(
                                          value: index,
                                          title: Text(massagistList[index]),
                                          groupValue: massagist,
                                          onChanged: (index) {
                                            setState(() {
                                              print(index);
                                              massagist = index;
                                            });
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          FormItem(label:S.of(context).address,controller:_addressController,isRequired:true,textColor:0xff333333),
                          FormItem(label:S.of(context).experience,controller:_experienceController,isRequired:true,textColor:0xff333333),
                          Container(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 20.rpx),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        child: Row(
                                          children: <Widget>[
                                            Text(S.of(context).abilityCertificate,style: TextStyle(color: Color(0xff333333),fontSize: 30.rpx),)
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                UploadPictureWidget(
                                  list: abilityCertificate,
                                  max: 9,
                                  callback: (newImgList){
                                    setState(() {
                                      abilityCertificate=newImgList;
                                    });
                                  },
                                )
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
