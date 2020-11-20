import 'package:flutter/material.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/utils/size_fit.dart';
import 'package:massageflutterapp/ui/widgets/button/theme_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:massageflutterapp/config/resouce_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:massageflutterapp/ui/widgets/form/form_item.dart';
class MakeAnAppointmentPage extends StatefulWidget {
  MakeAnAppointmentPage(id);


  @override
  _MakeAnAppointmentPageState createState() => _MakeAnAppointmentPageState();
}

class _MakeAnAppointmentPageState extends State<MakeAnAppointmentPage> {
  var address;
  var time;
  var remark=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(S.of(context).makeAnAppointment),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding:EdgeInsets.symmetric(vertical: 20.rpx),
                            decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Color(0xffeeeeee)))
                            ),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(S.of(context).orderNumber,style: TextStyle(color:Color(0xff666666),fontSize: 26.rpx)),
                                  Text(S.of(context).serviceTime,style: TextStyle(color:Color(0xff333333),fontSize: 26.rpx)),
                                ]
                            ),
                          ),
                          SizedBox(height: 20.rpx,),
                          Row(
                            children: <Widget>[
                              Container(
                                  padding: EdgeInsets.only(right: 20.rpx),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3)),
                                  child: CachedNetworkImage(
                                      height: 150.rpx,
                                      width: 150.rpx,
                                      imageUrl: ImageHelper.wrapUrl(ImageHelper.img),
                                      placeholder: (context, url) => Center(child: CupertinoActivityIndicator()),
                                      errorWidget: (context, url, error) => Icon(Icons.error))
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('3天经期全面调理 拷贝',style: TextStyle(color:Color(0xff333333),fontSize: 30.rpx),textAlign: TextAlign.left,overflow: TextOverflow.ellipsis,),
                                    Chip(
                                      label: Text(S.of(context).surplusComboOrder(8)),
                                      labelStyle: TextStyle(color: Theme.of(context).accentColor,fontSize: 24.rpx),
                                      backgroundColor: Color(0xffFAF1EA),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom:BorderSide(color: Color(0xffeeeeee))
                                )
                            ),
                            child: InkWell(
                              onTap: (){

                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      padding:EdgeInsets.symmetric(vertical: 20.rpx),
                                      child:Text(address==''?address:S.of(context).makeAnAppointmentAddress,style: TextStyle(color: Color(0xff666666),fontSize: 26.rpx),overflow: TextOverflow.ellipsis,),
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
                              onTap: (){},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      padding:EdgeInsets.symmetric(vertical: 20.rpx),
                                      child:Text(time==''?time:S.of(context).makeAnAppointmentTime,style: TextStyle(color: Color(0xff666666),fontSize: 26.rpx),overflow: TextOverflow.ellipsis,),
                                    ),
                                  ),
                                  Icon( Icons.arrow_forward_ios,color: Color(0xff999999),size: 16,)
                                ],
                              ),
                            ),

                          ),
                          Container(
                            padding:EdgeInsets.only(top: 10.rpx),
                            child: Text(S.of(context).remark+':',style: TextStyle(fontSize: 26.rpx),),
                          ),
                          TextField(
                            controller: remark,
                            maxLines:null,
                            keyboardType: TextInputType.multiline,
                            style: TextStyle(fontSize: 26.rpx),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText:S.of(context).remark,
                            ),
                          )
                        ],
                      )
                  ),
                ),
              ),
              ThemeButton(
                  title: S.of(context).makeAnAppointment,
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
