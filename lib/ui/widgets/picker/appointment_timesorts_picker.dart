import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:massageflutterapp/utils/getPicker.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/utils/size_fit.dart';
class AppointmentTimeSortsPicker extends StatefulWidget {
  @override
  _AppointmentTimeSortsPickerState createState() => _AppointmentTimeSortsPickerState();
}

class _AppointmentTimeSortsPickerState extends State<AppointmentTimeSortsPicker> {
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

  @override
  void initState() {
    var newTimeList=[];
    for(var i=0;i<365;i++){
      var next_datetime=currentDatetime.add(Duration(days: i));
      newTimeList.add(next_datetime.year.toString()+'-'+next_datetime.month.toString()+'-'+next_datetime.day.toString());
      timeList=newTimeList;
    }
    getCanSelectedTimeSorts();//初始化
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child: Text(S.of(context).cancel),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pop();
                    //fixme:确认
                  },
                  child: Text(S.of(context).confirm, style: TextStyle(color: Colors.red),),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: CupertinoPicker(
                    backgroundColor: Colors.white,
                    diameterRatio: 1.1,
                    scrollController: dateController,
                    itemExtent: 48.0,
                    onSelectedItemChanged: (position){
                      print('----');
                      print(timeList[position]);
                      print(currentTime);
                      if(timeList[position]==currentTime){
                        getCanSelectedTimeSorts();
                        timeSortsController.jumpToItem(0);
                      }else{
                        setState(() {
                          can_selected_timeSorts=timeSorts;
                          timeSortsController.jumpToItem(0);
                          print(can_selected_timeSorts);
                        });
                      }
                    },
                    children: createEachItem(timeList),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CupertinoPicker(
                    backgroundColor: Colors.white,
                    diameterRatio: 1.1,
                    scrollController: timeSortsController,
                    itemExtent: 48.0,
                    onSelectedItemChanged: (position){

                    },
                    children: createEachItem(can_selected_timeSorts),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  List<Widget> createEachItem(List data) {
    List<Widget> target = [];
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
