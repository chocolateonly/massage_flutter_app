import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/utils/size_fit.dart';
import 'package:massageflutterapp/ui/widgets/button/theme_button.dart';
class OrderCancelPage extends StatefulWidget {
  OrderCancelPage(id);


  @override
  _OrderCancelPageState createState() => _OrderCancelPageState();
}

class _OrderCancelPageState extends State<OrderCancelPage> {

  var reason=[
    '预约时间选错了 不想按摩了 与按摩师沟通协商车马费 延迟预约 其他原因',
    '2预约时间选错了 不想按摩了 与按摩师沟通协商车马费 延迟预约 其他原因',
    '3预约时间选错了 不想按摩了 与按摩师沟通协商车马费 延迟预约 其他原因',
  ];
  var selected=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(S.of(context).cancelAppointment),
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
                      padding:EdgeInsets.symmetric(vertical:20.rpx),
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          _myRadioListTile(),
                        ],
                      )
                  ),
                ),
              ),
              ThemeButton(
                  title: S.of(context).confirm,
                  onPressed:(){

                  }
              )
            ],
          ),
        ),
      ),
    );
  }


  _myRadioListTile() {
    return Column(
      children: <Widget>[
        ...List.generate(reason.length, (index){
          return RadioListTile(
              value: index,
              title: Text(reason[index]),
              activeColor: Theme.of(context).accentColor,
              dense: true,
              controlAffinity: ListTileControlAffinity.trailing,
              selected: index == selected ? true : false,
              groupValue: selected,
              onChanged: (v) {
                setState(() {
                  selected = index;
                });
              });
        })
      ],
    );
  }

}
