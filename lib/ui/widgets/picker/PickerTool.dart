import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:date_format/date_format.dart';
import 'package:massageflutterapp/generated/l10n.dart';

const double kPickerHeight = 216.0;
const double kItemHeight = 40.0;
const Color kBtnColor = Color(0xFF323232);//50
const Color kTitleColor = Color(0xFF787878);//120
const double kTextFontSize = 17.0;

typedef StringClickCallback = void Function(int selectIndex,Object selectStr);
typedef ArrayClickCallback = void Function( List<int> selecteds,List<dynamic> strData);
typedef DateClickCallback = void Function(dynamic selectDateStr,dynamic selectDate);

enum DateType {
  YMD,        // y, m, d
  YM,        // y ,m
  YMD_HM,     // y, m, d, hh, mm
  YMD_AP_HM,  // y, m, d, ap, hh, mm
}

class JhPickerTool {

  /** 单列*/
  static void showStringPicker<T>(
      BuildContext context, {
        @required List<T> data,
        String title,
        int normalIndex,
        PickerDataAdapter adapter,
        @required StringClickCallback clickCallBack,
        onSelect
      }) {

    openModalPicker(context,
        adapter: adapter ??  PickerDataAdapter( pickerdata: data, isArray: false),
        clickCallBack:(Picker picker, List<int> selecteds){
          //          print(picker.adapter.text);
          clickCallBack(selecteds[0],data[selecteds[0]]);
        },
        onSelect: (Picker picker,int index, List<int> selecteds){
          onSelect(index,selecteds);
        },
        selecteds: [normalIndex??0] ,
        title: title);
  }

  /** 多列 */
  static void showArrayPicker<T>(
      BuildContext context, {
        @required List<T> data,
        String title,
        List<int> normalIndex,
        PickerDataAdapter adapter,
        @required ArrayClickCallback clickCallBack,
        onSelect
      }) {
    openModalPicker(context,
        adapter: adapter ??  PickerDataAdapter( pickerdata: data, isArray: true),
        clickCallBack:(Picker picker, List<int> selecteds){
          clickCallBack(selecteds,picker.getSelectedValues());
        },
        selecteds: normalIndex,
        onSelect: (Picker picker,int index, List<int> selecteds){
          onSelect(index,selecteds);
        },
        title: title);

  }

//用于单纯的时间选择
  static void openModalPicker(
      BuildContext context, {
        @required PickerAdapter adapter,
        String title,
        List<int> selecteds,
        @required PickerConfirmCallback clickCallBack,
        PickerSelectedCallback onSelect,
      }) {
    new Picker(
        adapter: adapter,
        title: new Text(title ?? "请选择",style:TextStyle(color: kTitleColor,fontSize: kTextFontSize)),
        selecteds: selecteds,
        cancelText: '取消',
        confirmText: '确定',
        cancelTextStyle: TextStyle(color: kBtnColor,fontSize: kTextFontSize),
        confirmTextStyle: TextStyle(color: kBtnColor,fontSize: kTextFontSize),
        textAlign: TextAlign.right,
        itemExtent: kItemHeight,
        height: kPickerHeight,
        selectedTextStyle: TextStyle(color: Colors.black),
        onSelect: onSelect,
        onConfirm:clickCallBack
    ).showModal(context);
  }


  /** 日期选择器*/
  static void showDatePicker(
      BuildContext context, {
        DateType dateType,
        String title,
        DateTime maxValue,
        DateTime minValue,
        DateTime value,
        DateTimePickerAdapter adapter,
        @required DateClickCallback clickCallback,
      }) {

    int timeType;
    if(dateType == DateType.YM){
      timeType =  PickerDateTimeType.kYM;
    }else if(dateType == DateType.YMD_HM){
      timeType =  PickerDateTimeType.kYMDHM;
    }else if(dateType == DateType.YMD_AP_HM){
      timeType =  PickerDateTimeType.kYMD_AP_HM;
    }else{
      timeType =  PickerDateTimeType.kYMD;
    }

    openModalPicker(context,
        adapter: adapter ??
            DateTimePickerAdapter(
              type: timeType,
              isNumberMonth: true,
              yearSuffix: "年",
              monthSuffix: "月",
              daySuffix: "日",
              strAMPM: const["上午", "下午"],
              maxValue: maxValue ,
              minValue: minValue,
              value: value ?? DateTime.now(),
            ),
        title: title,
        clickCallBack:(Picker picker, List<int> selecteds){

          var time = (picker.adapter as DateTimePickerAdapter).value;
          var timeStr,timeStr2;
          if(dateType == DateType.YM){
            timeStr =time.year.toString()+"年"+time.month.toString()+"月";
            timeStr2=time.year.toString()+"-"+time.month.toString();
          }else if(dateType == DateType.YMD_HM){
            timeStr =time.year.toString()+"年"+time.month.toString()+"月"+time.day.toString()+"日"+time.hour.toString()+"时"+time.minute.toString()+"分";
            timeStr2 =time.year.toString()+"-"+time.month.toString()+"-"+time.day.toString()+" "+time.hour.toString()+":"+time.minute.toString()+"";

          }else if(dateType == DateType.YMD_AP_HM){
            var str = formatDate(time, [am])=="AM" ? "上午":"下午";
            timeStr =time.year.toString()+"年"+time.month.toString()+"月"+time.day.toString()+"日"+str+time.hour.toString()+"时"+time.minute.toString()+"分";
            timeStr2 = picker.adapter.text;
          }else{
            timeStr =time.year.toString()+"年"+time.month.toString()+"月"+time.day.toString()+"日";
            timeStr2=time.year.toString()+"-"+time.month.toString()+"-"+time.day.toString();
          }
          clickCallback(timeStr,picker.adapter.text.substring(0,16));

        }

    );

  }



}