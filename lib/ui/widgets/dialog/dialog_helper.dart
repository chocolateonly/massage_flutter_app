import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class DialogHelper {
  static showLoginDialog(context, title,content, confirm, cancel, onPressed) async {
    return await showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: Text(title),
              content: Text(content),
              actions: <Widget>[
                CupertinoDialogAction(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text(cancel,style: TextStyle(color:Color(0xff666666)),),
                ),
                CupertinoDialogAction(
                  onPressed: onPressed,
                  child: Text(confirm,style: TextStyle(color:Theme.of(context).accentColor),),
                ),
              ],
            ));
  }

  static showLoginDialog2(context, title, confirm,content, cancel, onPressed, onPressed2) async {
    return await showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: Text(title),
              content: Text(content),
              actions: <Widget>[
                CupertinoDialogAction(
                  onPressed: onPressed2,
                  child: Text(cancel,style: TextStyle(color:Color(0xff666666)),),
                ),
                CupertinoDialogAction(
                  onPressed: onPressed,
                  child:  Text(confirm,style: TextStyle(color:Theme.of(context).accentColor),),
                ),
              ],
            ));
  }
}
