import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:massageflutterapp/utils/size_fit.dart';

class OrderButton extends StatelessWidget {
  var title;

  var onPressed;

  var isOutLineButton;

  OrderButton({this.title: 'submit', this.onPressed,this.isOutLineButton:false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Container(
        padding: EdgeInsets.all(6),
        margin: EdgeInsets.only(left: 20.rpx),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.rpx),
            gradient: LinearGradient(
              colors: isOutLineButton?[Color(0xffffffff), Color(0xffffffff)]:[Color(0xff6A3B08), Color(0xffC7A163)],
            ),
            border: Border.all(color:isOutLineButton?Color(0xFF999999): Color(0xffffffff), width: 0.5)),
        child: Text(title,
          style: TextStyle(color:isOutLineButton? Color(0xFF666666):Colors.white, fontSize: 24.rpx),
        ),
      ),
    );
  }
}
