import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/utils/size_fit.dart';
import 'package:massageflutterapp/ui/widgets/button/theme_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:massageflutterapp/config/resouce_manager.dart';
import 'package:massageflutterapp/ui/widgets/picker/appointment_timesorts_picker.dart';
import 'package:massageflutterapp/ui/widgets/picker/area_picker.dart';

class MakeAnAppointmentPage extends StatefulWidget {
  MakeAnAppointmentPage(id);


  @override
  _MakeAnAppointmentPageState createState() => _MakeAnAppointmentPageState();
}

class _MakeAnAppointmentPageState extends State<MakeAnAppointmentPage> {

  var time;
  var remark=TextEditingController();
  var address;
  Map selectArea;
  ///接收选择的结果
  void handleSelect (Map targetArea) {
    setState(() {
      selectArea = targetArea;
    });
  }
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                    child: Row(
                                      children: <Widget>[
                                        Text(S.of(context).orderNumber,style: TextStyle(color:Color(0xff666666),fontSize: 26.rpx)),
                                        Text(S.of(context).serviceTime,style: TextStyle(color:Color(0xff333333),fontSize: 26.rpx)),
                                      ],
                                    ),
                                  ),
                                  Chip(
                                    label: Text(S.of(context).surplusComboOrder(8)),
                                    labelStyle: TextStyle(color: Theme.of(context).accentColor,fontSize: 24.rpx),
                                    backgroundColor: Color(0xffFAF1EA),
                                  )
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
                                      width:  150.rpx,
                                      imageUrl: ImageHelper.wrapUrl(ImageHelper.img),
                                      placeholder: (context, url) => Center(child: CupertinoActivityIndicator()),
                                      errorWidget: (context, url, error) => Icon(Icons.error))
                              ),
                              Expanded(
                                child: Container(
                                  height: 150.rpx,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text('3天经期全面调理 拷贝',style: TextStyle(color:Color(0xff333333),fontSize: 30.rpx),textAlign: TextAlign.left,overflow: TextOverflow.ellipsis,),
                                      Text('挥洒法华寺东方航空史蒂芬霍金看到的非官方定',style: TextStyle(color:Color(0xff999999),fontSize: 24.rpx),textAlign: TextAlign.left,overflow: TextOverflow.ellipsis,),
                                      Text('x1',style: TextStyle(color:Color(0xff999999),fontSize: 24.rpx),textAlign: TextAlign.left,),

                                    ],
                                  ),
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
                                showModalBottomSheet(context: context, builder: (_)=>Container(
                                  height: 300.0,
                                  child: AreaSelection(
                                    onSelect: handleSelect,
                                    initProviceIndex: selectArea == null ? 0 : selectArea['proviceIndex'],
                                    initCityIndex: selectArea == null ? 0 : selectArea['cityIndex'],
                                    initCountyIndex: selectArea == null ? 0 : selectArea['countyIndex'],
                                  ),
                                ));
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
                              onTap: (){
//                                时间选择
                                showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AppointmentTimeSortsPicker();
                                  },
                                );
                              },
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
//                   备注
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
                          ),

                          Container(
                            padding:EdgeInsets.symmetric(vertical: 20.rpx),
                            child: Text(S.of(context).makeAnAppointmentTip,style: TextStyle(color: Color(0xff666666), fontSize: 26.rpx)),
                          )
                        ],
                      )
                  ),
                ),
              ),
              ThemeButton(
                  title: S.of(context).makeAnAppointment,
                  onPressed:(){
                  }
              )
            ],
          ),
        ),
      ),
    );
  }

}
