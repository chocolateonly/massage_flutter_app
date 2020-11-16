import 'dart:async';

import 'package:flutter/material.dart';
import 'package:massageflutterapp/generated/l10n.dart';
//获取验证码按钮
class CodeButton extends StatefulWidget {

  @override
  _CodeButtonState createState() => _CodeButtonState();
}

class _CodeButtonState extends State<CodeButton> {
    int type=0;
    var countdownTime=0;
    Timer _timer=null;

  startCountdown() {
    if (type == 1) {
      return;
    }
    countdownTime = 60;//设置倒计时时间
    final call = (timer) {
      setState(() {
        if (countdownTime < 1) {
          _timer.cancel();
          type = 0;
        } else {
          countdownTime -= 1;
          type = 1;
        }
      });
    };
    _timer = Timer.periodic(Duration(seconds: 1), call);

//    todo:去获取验证码


  }
    @override
    void dispose() {
    //print('remove---------');
      // 默认没有传入controller,需要内部释放
      if (_timer != null) {
        _timer.cancel();
      }
      super.dispose();
    }
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: (){
        startCountdown();
      },
      child: Text(
        type==0?S.of(context).getCode:S.of(context).getCodeTip(countdownTime),
        style: TextStyle(color:Color(0xff666666) ),),
    );
  }
}
