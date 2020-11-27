import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/utils/size_fit.dart';
import 'package:massageflutterapp/ui/widgets/button/theme_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:massageflutterapp/config/resouce_manager.dart';
import 'package:massageflutterapp/ui/widgets/upload_picture_widget.dart';
import 'package:massageflutterapp/ui/widgets/rate_star.dart';
class OrderCommentPage extends StatefulWidget {
  OrderCommentPage(id);


  @override
  _OrderCommentPageState createState() => _OrderCommentPageState();
}

class _OrderCommentPageState extends State<OrderCommentPage> {

  var comment=TextEditingController();
  @override
  Widget build(BuildContext context) {
    var CommentItem=[
      S.of(context).service,
      S.of(context).keepTime,
      S.of(context).ability,
      S.of(context).appearance,
      S.of(context).cleanScore
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(S.of(context).orderComment),
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
                      padding:EdgeInsets.all(20.rpx),
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding:EdgeInsets.symmetric(vertical: 20.rpx),
                            decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Color(0xffeeeeee)))
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                    child: Row(
                                      children: <Widget>[
                                        Text(S.of(context).orderNumber,style: TextStyle(color:Color(0xff666666),fontSize: 26.rpx)),
                                        Text('34543534',style: TextStyle(color:Color(0xff333333),fontSize: 26.rpx)),
                                      ],
                                    ),
                                  )
                                ]
                            ),
                          ),
                          SizedBox(height: 20.rpx,),
                          Row(
                            children: <Widget>[
                              Container(
                                  padding: EdgeInsets.only(right: 20.rpx),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3)),
                                  child: CachedNetworkImage(
                                      height: 150.rpx,
                                      width:  150.rpx,
                                      imageUrl: ImageHelper.wrapUrl(ImageHelper.img),
                                      placeholder: (context, url) => Center(child: CupertinoActivityIndicator()),
                                      errorWidget: (context, url, error) => Icon(Icons.error))
                              ),
                              Expanded(
                                child: Container(
                                  height: 150.rpx,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text('3天经期全面调理 拷贝',style: TextStyle(color:Color(0xff333333),fontSize: 30.rpx),textAlign: TextAlign.left,overflow: TextOverflow.ellipsis,),
                                      Text('挥洒法华寺东方航空史蒂芬霍金看到的非官方定',style: TextStyle(color:Color(0xff999999),fontSize: 24.rpx),textAlign: TextAlign.left,overflow: TextOverflow.ellipsis,),
                                      Text('x1',style: TextStyle(color:Color(0xff999999),fontSize: 24.rpx),textAlign: TextAlign.left,),

                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
//                   评价
                          TextField(
                            controller: comment,
                            maxLines:5,
                            minLines:5,
                            keyboardType: TextInputType.multiline,
                            style: TextStyle(fontSize: 26.rpx),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText:S.of(context).commentTip,
                            ),
                          ),
//                          添加图片
                         Container(
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    UploadPictureWidget(
                    list: List.generate(7, (index) => ImageHelper.img),
                     callback: (){
                      print('callback');
                     },
                )
                  ],
                ),
              ),
//星级
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      width: 6.rpx,
                                      height: 30.rpx,
                                      color: Theme.of(context)
                                          .accentColor,
                                    ),
                                    SizedBox(
                                      width: 10.rpx,
                                    ),
                                    Expanded(
                                      child: Text(S.of(context).orderScore, style: TextStyle(color: Color(0xff000000), fontSize: 30.rpx), overflow: TextOverflow.ellipsis,),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.rpx,
                          ),
                          ...List.generate(5, (index) =>Container(
                            padding:EdgeInsets.only(bottom: 10.rpx),
                            child: Row(
                              children: <Widget>[
                                Text(CommentItem[index]+':', style: TextStyle(color: Color(0xff333333), fontSize: 28.rpx), overflow: TextOverflow.ellipsis,),
                                Expanded(child: RateStar(currentVal:-1,
                                    callback:(newVal){
                                        print(newVal);
                                    }
                                    )),
                              ],
                            ),
                          ),)
                        ],
                      )
                  ),
                ),
              ),
              ThemeButton(
                  title: S.of(context).submit,
                  onPressed:(){

                  }
              )
            ],
          ),
        ),
      ),
    );
  }

}
