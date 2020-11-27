import 'package:flutter/material.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/utils/size_fit.dart';
import 'package:massageflutterapp/ui/widgets/button/theme_button.dart';
class FormFinishTip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.rpx),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,//自动撑高
        children: <Widget>[
          Container(
            width:double.maxFinite,
            padding: EdgeInsets.all(40.rpx),
            decoration: BoxDecoration(
                color: Theme.of(context).accentColor
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.check_circle,color: Theme.of(context).accentColor,size: 50.rpx,),
                Text(S.of(context).tipTile,style: TextStyle(color: Colors.white,fontSize: 30.rpx),)
              ],
            ) ,
          ),
          Container(
            padding: EdgeInsets.all(40.rpx),
            child:  Text(S.of(context).formFinishTip,
              style: TextStyle(color: Color(0xff4d4d4d),fontSize: 32.rpx),textAlign: TextAlign.center,),
          ),
          Container(
            width: 480.rpx,
            child: ThemeButton(
              title:S.of(context).know,
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
