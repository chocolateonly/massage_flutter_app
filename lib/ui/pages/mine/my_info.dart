import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/utils/size_fit.dart';
import 'package:massageflutterapp/config/resouce_manager.dart';
class MyInfoPage extends StatefulWidget {

  @override
  _MyInfoPageState createState() => _MyInfoPageState();
}

class _MyInfoPageState extends State<MyInfoPage> {

  var _phoneController=TextEditingController();
  Widget imgWidth;

  @override
  Widget build(BuildContext context) {

    imgWidth = CachedNetworkImage(
        alignment: Alignment.topRight,
        fit: BoxFit.cover,
        height: 50,
        width: 50,
        imageUrl: ImageHelper.img,
        placeholder: (context, url) => Center(child: CupertinoActivityIndicator()),
        errorWidget: (context, url, error) => Icon(Icons.error));

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(S.of(context).myInfo),
      ),
      body:  GestureDetector(
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
                      child: Column(
                        children: <Widget>[
                          Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(color: Color(0xffeeeeee))
                                  )
                              ),
                              child: InkWell(
                                onTap: (){

                                },
                                child: Row(
                                  children: <Widget>[
                                    Text(S.of(context).avatar),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            width: 160.rpx,
                                            child: Text(
                                              S.of(context).avatar,
                                              style: TextStyle(fontSize: 15.px),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(vertical: 5),
                                            child: ClipOval(
                                              child: imgWidth,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                          ),
                          Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(color: Color(0xffeeeeee))
                                  )
                              ),
                              child: Row(
                                children: <Widget>[
                                  Text(S.of(context).ID,style: TextStyle(color: Color(0xff666666)),),
                                  Expanded(
                                    child: TextField(
                                      controller: new TextEditingController(text: 'ididid'),
                                      readOnly: true,
                                      style: TextStyle(color:Color(0xff999999) ),
                                      textAlign: TextAlign.right,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                          ),
                          Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(color: Color(0xffeeeeee))
                                  )
                              ),
                              child: Row(
                                children: <Widget>[
                                  Text(S.of(context).mobile,style: TextStyle(color: Color(0xff666666)),),
                                  Expanded(
                                    child: TextField(
                                      controller: _phoneController,
                                      style: TextStyle(color:Color(0xff999999) ),
                                      textAlign: TextAlign.right,
                                      keyboardType: TextInputType.phone,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                          ),
                        ],
                      )
                  ),
                ),
              ),
              Container(
                width:double.maxFinite,
                margin: EdgeInsets.all(20.rpx),
                child: CupertinoButton(
                    color: Theme.of(context).accentColor,
                    borderRadius:BorderRadius.circular(60.rpx),
                    child: Text(S.of(context).submit,style: TextStyle(color: Colors.white,fontSize: 30.rpx),),

                    onPressed: () {

                    }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


}

