import 'package:flutter/material.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/utils/size_fit.dart';
import 'package:massageflutterapp/ui/widgets/button/theme_button.dart';
import 'package:massageflutterapp/config/router_manager.dart';
import 'package:massageflutterapp/ui/widgets/upload_picture_widget.dart';
class PersonalSettingsPage extends StatefulWidget {

  @override
  _PersonalSettingsPageState createState() => _PersonalSettingsPageState();
}

class _PersonalSettingsPageState extends State<PersonalSettingsPage> {
  var goodMassagistCertificate=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(S.of(context).personalSettings),
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
                            Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(color: Color(0xffeeeeee))
                                    ),
                                ),
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
                                          child:Text(S.of(context).exchangeBankCard,style: TextStyle(color: Color(0xff666666)),overflow: TextOverflow.ellipsis,),
                                        ),
                                      ),
                                      Icon( Icons.arrow_forward_ios,color: Color(0xff999999),size: 16,)
                                    ],
                                  ),
                                )
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom:BorderSide(color: Color(0xffeeeeee))
                                  )
                              ),
                              child: InkWell(
                                onTap: (){
//                                时间选择
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      //return AppointmentTimeSortsPicker();
                                    },
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        padding:EdgeInsets.symmetric(vertical: 20.rpx),
                                        child:Text(S.of(context).workTimeSort,style: TextStyle(color: Color(0xff666666)),overflow: TextOverflow.ellipsis,),
                                      ),
                                    ),
                                    Icon( Icons.arrow_forward_ios,color: Color(0xff999999),size: 16,)
                                  ],
                                ),
                              ),

                            ),

                            Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom:BorderSide(color: Color(0xffeeeeee))
                                  )
                              ),
                              child: InkWell(
                                onTap: (){
//                                时间选择
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      //return AppointmentTimeSortsPicker();
                                    },
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        padding:EdgeInsets.symmetric(vertical: 20.rpx),
                                        child:Text(S.of(context).workAreaSelect,style: TextStyle(color: Color(0xff666666)),overflow: TextOverflow.ellipsis,),
                                      ),
                                    ),
                                    Icon( Icons.arrow_forward_ios,color: Color(0xff999999),size: 16,)
                                  ],
                                ),
                              ),

                            ),
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
                                              Text(S.of(context).goodMassagistCertificate,style: TextStyle(color: Color(0xff666666)),)
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  UploadPictureWidget(
                                    list: goodMassagistCertificate,
                                    max: 9,
                                    callback: (newImgList){
                                      setState(() {
                                        goodMassagistCertificate=newImgList;
                                      });
                                    },
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
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
}
