import 'package:date_format/date_format.dart';
import 'package:massageflutterapp/ui/widgets/picker/PickerTool.dart';
 dateFormat(currentDatetime,arg){
  var time;
  switch(arg){
    case 'ymd':time=currentDatetime.year.toString()+'-'+currentDatetime.month.toString()+'-'+currentDatetime.day.toString();
    break;
    case 'HH':time=int.parse(formatDate(currentDatetime, [HH]));
    break;
    default:time=currentDatetime.year.toString()+'-'+currentDatetime.month.toString()+'-'+currentDatetime.day.toString();
  }
  return time;
}
selectTimePicker(context){
  //底部弹出层
  var currentDatetime=new DateTime.now();
  var currentTime=formatDate(currentDatetime,[yyyy,'-',mm,'-',dd]);//2020-11-21
  var timeSorts=['8:00-11:00','11:00-14:00','14:00-17:00','17:00-20:00','20:00-23:00'];
  var timeList=[];
  var can_selected_timeSorts=[];
  for(var i=0;i<365;i++){
    var next_datetime=currentDatetime.add(Duration(days: i+1));
    timeList.add(formatDate(next_datetime,[yyyy,'-',mm,'-',dd]));
  }
  getCanSelectedTimeSorts(){
    timeSorts.forEach((item) {
      print(item);
      var s_item=item.split('-');
      var start=s_item[0].split(':')[0];
      var end=s_item[1].split(':')[0];
      var currentHour=formatDate(currentDatetime, [HH]);
      print(currentHour);
      if(int.parse(currentHour)>int.parse(start)&&int.parse(currentHour)>int.parse(end)) {
      }else{
        can_selected_timeSorts.add(item);
      }
    }
    );
  }
  getCanSelectedTimeSorts();//初始化
  return JhPickerTool.showArrayPicker(
      context,
      data:[timeList,can_selected_timeSorts],//数据源
      normalIndex: [0,0],//索引
      onSelect: (index,selectedIndex){
        if(timeList[selectedIndex[index]]==currentTime){
          getCanSelectedTimeSorts();
        }else{
          can_selected_timeSorts=timeSorts;
        }
      },
      clickCallBack:(var index, var strData){
        print(index);
        print(strData);
      }
  );
}