import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:massageflutterapp/utils/size_fit.dart';

class ThemeButton extends StatelessWidget {
  var title;

  var onPressed;

  ThemeButton({this.title:'submit',this.onPressed});
  @override
  Widget build(BuildContext context) {
    return               Container(
      width:double.maxFinite,
      margin: EdgeInsets.all(20.rpx),
      child: CupertinoButton(
          color: Theme.of(context).accentColor,
          borderRadius:BorderRadius.circular(60.rpx),
          child: Text(title,style: TextStyle(color: Colors.white,fontSize: 30.rpx),),

          onPressed: () {
            onPressed();
          }
      ),
    );
  }
}
