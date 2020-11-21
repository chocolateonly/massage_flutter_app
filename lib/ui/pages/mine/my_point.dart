import 'package:flutter/material.dart';
import 'package:massageflutterapp/config/resouce_manager.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/utils/size_fit.dart';
class MyPointPage extends StatefulWidget {

  @override
  _MyPointPageState createState() => _MyPointPageState();
}

class _MyPointPageState extends State<MyPointPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(S.of(context).myPoint),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap:  (){
          //点击输入框以外的地方  收起键盘
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.rpx),
            child:Column(
              children: <Widget>[
//                积分
                Container(
                  width:double.maxFinite,
                  height: 340.rpx,
                  decoration: BoxDecoration(
//                背景图
                    image: new DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(ImageHelper.wrapAssets('my_point_bg.png')),
                  ),
                ),
                 child: Container(
                   padding: const EdgeInsets.symmetric(horizontal: 10),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: <Widget>[
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: <Widget>[
                           Expanded(child: Text(S.of(context).myPoint,style: TextStyle(color: Colors.white,fontSize: 32.rpx),overflow: TextOverflow.ellipsis,)),
                           FlatButton(
                             color: Colors.white,
                             onPressed: (){},
                             child: Text(S.of(context).myPointRecord,style: TextStyle(color: Color(0xff6F6349),fontSize: 30.rpx),),
                             shape: StadiumBorder(
                               side: BorderSide(
                                 width: 2,
                                 color: Colors.red,
                                 // style: BorderStyle.solid,
                                 style: BorderStyle.none,
                               ),
                             ),
                           )
                         ],
                       ),
                       Text('879879',style: TextStyle(color: Colors.white,fontSize: 83.rpx),overflow: TextOverflow.ellipsis,),
                     ],
                   ),
                 ),
                ),
//                商品标题
               Container(
                 padding: const EdgeInsets.symmetric(vertical: 10),
                 child:  Text(S.of(context).allGoods,style: TextStyle(color: Color(0xff333333),fontSize: 36.rpx),overflow: TextOverflow.ellipsis,),
               ),
//todo
              ],
            )
        ),
      ),
    );
  }
}
