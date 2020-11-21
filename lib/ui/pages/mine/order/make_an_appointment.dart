import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/utils/size_fit.dart';
import 'package:massageflutterapp/ui/widgets/button/theme_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:massageflutterapp/config/resouce_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:massageflutterapp/ui/widgets/picker/PickerTool.dart';
import 'package:massageflutterapp/utils/getPicker.dart';
class MakeAnAppointmentPage extends StatefulWidget {
  MakeAnAppointmentPage(id);


  @override
  _MakeAnAppointmentPageState createState() => _MakeAnAppointmentPageState();
}

class _MakeAnAppointmentPageState extends State<MakeAnAppointmentPage> {
  var address;
  var time;
  var remark=TextEditingController();
  var timeList=[];
  var can_selected_timeSorts=[];
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
                              onTap: (){
//                                时间选择
                                selectTimePicker(context);

//底部弹出层
                                /*var currentDatetime=new DateTime.now();
                                var currentTime=currentDatetime.year.toString()+'-'+currentDatetime.month.toString()+'-'+currentDatetime.day.toString();//2020-11-21
                                print('time');
                                print(currentTime);
                                var timeSorts=['5:00-8:00','8:00-11:00','11:00-14:00','14:00-17:00','17:00-20:00','20:00-23:00'];
                                var newTimeList=[];
                                var new_can_selected_timeSorts=[];
                                for(var i=0;i<365;i++){
                                  var next_datetime=currentDatetime.add(Duration(days: i+1));
                                  newTimeList.add(next_datetime.year.toString()+'-'+next_datetime.month.toString()+'-'+next_datetime.day.toString());
                                  setState(() {
                                    timeList=newTimeList;
                                  });
                                }
                                getCanSelectedTimeSorts(){
                                  timeSorts.forEach((item) {
                                    print(item);
                                    var s_item=item.split('-');
                                    var start=s_item[0].split(':')[0];
                                    var end=s_item[1].split(':')[0];
                                    print(currentDatetime);
                                    var currentHour=currentDatetime.hour;

                                    if(currentHour>int.parse(start)&&currentHour>int.parse(end)) {
                                    }
                                    else if(currentHour>int.parse(start)&&currentHour==int.parse(end)) {
//                                      比较分钟

                                    }
                                    else{
                                      new_can_selected_timeSorts.add(item);
                                    }
                                  }
                                  );
                                  setState(() {
                                    can_selected_timeSorts=new_can_selected_timeSorts;
                                  });
                                }
                                getCanSelectedTimeSorts();//初始化
                                return JhPickerTool.showArrayPicker(
                                    context,
                                    data:[timeList,can_selected_timeSorts],//数据源
                                    normalIndex: [0,0],//索引
                                    onSelect: (index,selectedIndex){
                                      if(timeList[selectedIndex[0]]==currentTime){
                                        getCanSelectedTimeSorts();
                                      }else{
                                        setState(() {
                                          can_selected_timeSorts=timeSorts;
                                          print(can_selected_timeSorts);
                                        });
                                      }
                                    },
                                    clickCallBack:(var index, var strData){
                                      print(index);
                                      print(strData);
                                    }
                                );*/
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
