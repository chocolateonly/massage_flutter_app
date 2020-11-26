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
import 'package:massageflutterapp/ui/widgets/picker/area_picker.dart';
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
  var dateController=FixedExtentScrollController(initialItem: 0);
  var timeSortsController=FixedExtentScrollController(initialItem: 0);

  static var currentDatetime=new DateTime.now();
  var currentTime=currentDatetime.year.toString()+'-'+currentDatetime.month.toString()+'-'+currentDatetime.day.toString();//2020-11-21
  var timeSorts=['5:00-8:00','8:00-11:00','11:00-14:00','14:00-17:00','17:00-20:00','20:00-23:00'];

  getCanSelectedTimeSorts(){

    var new_can_selected_timeSorts=[];
    timeSorts.forEach((item) {
      var s_item=item.split('-');
      var start=s_item[0].split(':')[0];
      var end=s_item[1].split(':')[0];
      var currentHour=dateFormat(currentDatetime,'HH');
      print('local');
      print(currentDatetime);
      print(currentHour);

      /*
      * String utcTime="2019-03-02T12:25:55.010Z";
        DataTime beijingTime=DateTime.parse("${utcTime.substring(0,19)}-0800");

        print('返回UTC与本地时差 小时数：${currentDatetime.timeZoneOffset}');
      * */
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
    print('ooo');
    print(can_selected_timeSorts);
  }
  Map selectArea;

  ///接收选择的结果
  void handleSelect (Map targetArea) {
    setState(() {
      selectArea = targetArea;
    });
  }

  @override
  void initState() {
    var newTimeList=[];
    for(var i=0;i<365;i++){
      var next_datetime=currentDatetime.add(Duration(days: i+1));
      newTimeList.add(next_datetime.year.toString()+'-'+next_datetime.month.toString()+'-'+next_datetime.day.toString());
        timeList=newTimeList;
    }
    getCanSelectedTimeSorts();//初始化
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(S.of(context).makeAnAppointment),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child:  Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 16.0),
                  child: Text(selectArea != null ? selectArea['address'] : '未选择...'),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: (){
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
                  child: Text('点击选择省市区'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> createEachItem(List data) {
    List<Widget> target = [];
    print(data);
    data.forEach((element) {
      target.add(Container(
        padding: EdgeInsets.only(top: 14.0, bottom: 10.0),
        child: Text(
          element ?? '',
          style: TextStyle(fontSize: 14.0),
        ),
      ));
    });

    return target;
  }
}
