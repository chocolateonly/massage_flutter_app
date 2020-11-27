import 'package:flutter/material.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/config/resouce_manager.dart';
import 'package:massageflutterapp/utils/size_fit.dart';
import 'package:massageflutterapp/utils/save_image.dart';
import 'package:massageflutterapp/ui/widgets/button/theme_button.dart';
import 'package:flutter/services.dart';
class MyInviteCode extends StatefulWidget {
  @override
  _MyInviteCodeState createState() => _MyInviteCodeState();
}

class _MyInviteCodeState extends State<MyInviteCode> {
  var code='123456'.split('');
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.rpx),
      margin: EdgeInsets.all(10.rpx),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.rpx),
        color: Colors.white,
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(S.of(context).myInviteCode,style: TextStyle(color: Theme.of(context).accentColor,fontSize: 36.rpx),),
          SizedBox(height: 20.rpx,),
          Image.network(ImageHelper.img,width: 236.rpx,height:236.rpx,),
          Container(
            width: 540.rpx,
            child: ThemeButton(
              title:S.of(context).save+S.of(context).myInviteCode,
              onPressed: (){
                AppUtil.saveImage(ImageHelper.img);
              },
            ),
          ),
          SizedBox(height: 20,),
          Row(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Text(S.of(context).inviteCode,style: TextStyle(color: Color(0xff666666),fontSize: 26.rpx),),
                    Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            ...List.generate(code.length, (index) => Container(
                              width:48.rpx,
                              height: 50.rpx,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xffeeeeee))
                              ),
                              child: Center(child: Text(code[index],style: TextStyle(color: Color(0xff333333),fontSize: 34.rpx),)),
                            )),

                          ],
                        )
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: (){
                  Clipboard.setData(ClipboardData(text: '复制到剪切板'));
                },
                child: Text(S.of(context).clickCopy,style: TextStyle(color: Theme.of(context).accentColor,fontSize: 26.rpx),),
              )
            ],
          )
        ],
      ),
    );
  }
}
