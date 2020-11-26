//商品关注

import 'package:massageflutterapp/utils/size_fit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/config/resouce_manager.dart';
class GoodsItemFocus extends StatefulWidget {
  var item;
  var onClickItem;
  GoodsItemFocus(this.item,{this.onClickItem:null});
  @override
  _GoodsItemFocusState createState() => _GoodsItemFocusState();
}

class _GoodsItemFocusState extends State<GoodsItemFocus> {
  var isFocus=false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        return widget.onClickItem();
      },
      child: Card(
        clipBehavior: Clip.antiAlias,//超出剪切
        shape:  RoundedRectangleBorder(borderRadius:BorderRadius.circular(20.rpx)),
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Container(
                    width: double.maxFinite,
                    height: 328.rpx,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit:BoxFit.cover,
                            image:NetworkImage(ImageHelper.wrapUrl(ImageHelper.img))
                        )
                    ),
                  ),
                ),
                Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(widget.item.name,style:TextStyle(color:   Color(0xff333333),fontSize: 34.rpx),overflow: TextOverflow.ellipsis,),
                        Text('说明文字说明文字',style:TextStyle(color:   Color(0xff999999),fontSize: 24.rpx),overflow: TextOverflow.ellipsis,),
                        //价格
                        Row(
                          children: <Widget>[
                            Expanded(
                              child:Row(
                                children: <Widget>[
                                  Text(S.of(context).priceUnit,style:TextStyle(color: Color(0xffEC1C24),fontSize: 26.rpx)),
                                  Text('2000.5',style:TextStyle(color: Color(0xffEC1C24),fontSize: 38.rpx ),overflow: TextOverflow.ellipsis,),
                                  SizedBox(width: 10.rpx,),
                                  Text(S.of(context).priceUnit,style:TextStyle(color: Color(0xff999999),fontSize: 26.rpx,
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: const Color(0xff999999),),),
                                  Expanded(
                                    flex: 1,
                                    child:Text('299000.5',style:TextStyle(color: Color(0xff999999),fontSize: 26.rpx,
                                      decoration: TextDecoration.lineThrough,
                                      decorationColor: const Color(0xff999999),),overflow: TextOverflow.ellipsis),
                                  ),
                                ],
                              ),
                            ),
                            Icon(Icons.add_circle,color: Color(0xff6D3E0B))
                          ],
                        ),
                      ],
                    )
                ),
              ],
            ),
            Positioned(
              top:20.rpx,
              left:20.rpx,
              width:33.rpx,height: 27.rpx,
              child:  InkWell(
                onTap: (){
                  print('sss');
                  setState(() {
                    isFocus=!isFocus;
                  });
                  //关注 取消
                },
                child: isFocus?Image.asset(ImageHelper.wrapAssets('icon_heart.png'),width:33.rpx,height: 27.rpx,):
                Image.asset(ImageHelper.wrapAssets('icon_heart_null.png'),width:33.rpx,height: 27.rpx,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}