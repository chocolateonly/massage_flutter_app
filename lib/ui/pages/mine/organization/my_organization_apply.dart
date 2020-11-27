import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/utils/size_fit.dart';
import 'package:massageflutterapp/ui/widgets/button/theme_button.dart';
import 'package:massageflutterapp/config/router_manager.dart';
import 'package:massageflutterapp/ui/widgets/form/form_item.dart';

import 'package:massageflutterapp/config/resouce_manager.dart';
import 'package:massageflutterapp/ui/widgets/upload_picture_widget.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:massageflutterapp/ui/widgets/form_finish_tip.dart';

class MyOrganizationApplyPage extends StatefulWidget {

  @override
  _MyOrganizationApplyPageState createState() => _MyOrganizationApplyPageState();
}

class _MyOrganizationApplyPageState extends State<MyOrganizationApplyPage> {
  var _nameController=TextEditingController();
  var _usernameController=TextEditingController();
  var _mobileController=TextEditingController();
  var infoExtra=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(S.of(context).orgApply),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap:  (){
          //点击输入框以外的地方  收起键盘
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
               Container(
                 margin: EdgeInsets.only(top:20.rpx,left: 20.rpx,right:20.rpx),
                child: Text(S.of(context).orgApplyTip,style: TextStyle(color: Theme.of(context).accentColor,fontSize: 30.rpx),textAlign: TextAlign.left,),
              ),
              Container(
                width: double.maxFinite,
                child: Card(
                  margin: EdgeInsets.all(20.rpx),
                  shape:  RoundedRectangleBorder(borderRadius:BorderRadius.circular(20.rpx)),
                  child: Container(
                      padding:EdgeInsets.all(20.rpx),
                      child:Container(
                        child: Column(
                          children: <Widget>[
                            FormItem(label:S.of(context).orgName,controller:_nameController,isRequired:true,textColor:0xff333333),
                            FormItem(label:S.of(context).orgLeader,controller:_usernameController,isRequired:true,textColor:0xff333333),
                            FormItem(label:S.of(context).contactWay,controller:_mobileController,isRequired:true,textColor:0xff333333),
                            Container(
                              child: Column(
                                children: <Widget>[
//标题项
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 20.rpx),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                          width:150.rpx,
                                          child: Row(
                                            children: <Widget>[Text("*",style: TextStyle(color: Colors.red),), Text(S.of(context).infoExtra,style: TextStyle(color: Color(0xff333333),fontSize: 30.rpx),)
                                            ],
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () async{

                                            //获取存储路径
                                            var appDocDir = await getApplicationDocumentsDirectory();
                                            //下载
                                            Dio dio = new Dio();
                                            await  dio.download(ImageHelper.img, appDocDir.path+'test.png');
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(vertical: 6.rpx,horizontal: 20.rpx),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(30.rpx),
                                              border: Border.all(color: Theme.of(context).accentColor)
                                            ),
                                            child: Text(S.of(context).extraDownload,style: TextStyle(color: Theme.of(context).accentColor,fontSize: 26.rpx),),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  UploadPictureWidget(
                                    list: infoExtra,
                                    max: 9,
                                    callback: (newImgList){
                                      setState(() {
                                          infoExtra=newImgList;
                                      });
                                    },
                                  )
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                children: <Widget>[
//标题项
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 20.rpx),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                          child: Row(
                                            children: <Widget>[
                                              Text(S.of(context).leaderIdCard,style: TextStyle(color: Color(0xff333333),fontSize: 30.rpx),)
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                   Row(
                                     children: <Widget>[
                                       Expanded(
                                         flex: 1,
                                         child: UploadItem(context,
                                           text:S.of(context).idCardFont,
                                           callback: (){
                                            setState(() {
                                              
                                            });
                                           },
                                         ),
                                       ),
                                       SizedBox(width: 10.rpx,),
                                       Expanded(
                                         flex: 1,
                                         child: UploadItem(context,
                                           text:S.of(context).idCardBack,
                                           callback: (){
                                             setState(() {

                                             });
                                           },
                                         ),
                                       ),
                                     ],
                                   )


                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                children: <Widget>[
//标题项
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 20.rpx),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                          child: Row(
                                            children: <Widget>[
                                              Text(S.of(context).license,style: TextStyle(color: Color(0xff333333),fontSize: 30.rpx),)
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
//fixme
                                  UploadPictureWidget(
                                    list: infoExtra,
                                    max: 9,
                                    callback: (newImgList){
                                      setState(() {
                                        infoExtra=newImgList;
                                      });
                                    },
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                  ),
                ),
              ),
              ThemeButton(
                  title: S.of(context).submit,
                  onPressed:(){
                    showDialog(
                        context:context,
                        barrierDismissible:true,//点击遮罩是否关闭
                        builder: (context) {
                          return Dialog(
                              clipBehavior: Clip.antiAlias,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10.rpx))
                              ),
                              child:FormFinishTip()
                          );
                        }
                    );
                  }
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(S.of(context).bottomTip,style: TextStyle(color: Color(0xff999999),fontSize: 26.rpx)),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).pushNamed(RouteName.applyWord,arguments: [S.of(context).orgBottomWord,1]);
                    },
                    child: Text(S.of(context).orgBottomWord,style: TextStyle(color:Theme.of(context).accentColor,fontSize: 26.rpx),),
                  ),
                ],
              ),
              SizedBox(height: 20.rpx,)
            ],
          ),
        ),
      ),
    );
  }

}

class UploadItem extends StatefulWidget {
  var text;
  var callback;

  
  UploadItem(BuildContext context,{this.text:'选择图片',this.callback});

  @override
  _UploadItemState createState() => _UploadItemState();

}

class _UploadItemState extends State<UploadItem> {
  var isSub=false;
  var img='';
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()async {
        if(isSub) return;
        isSub=true;
        var images = await uploadImages(context,1);
        isSub=false;
        setState(() {
          img=images[0];
          print('object');
          print(img);
          widget.callback(img);
        });
      },
      child: Container(
        clipBehavior:Clip.antiAlias,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.rpx),
            border: Border.all(color: Color(0xffdcdcdc))
        ),
        child: Container(
          child: img!=''?Container(
            width: double.maxFinite,
            height: 200.rpx,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(img)
              )
            ),
          ):
          Container(
            width: double.maxFinite,
            height: 200.rpx,
            padding: EdgeInsets.symmetric(vertical:40.rpx,horizontal: 20.rpx),
            child: Column(
              children: <Widget>[
                Image.asset(ImageHelper.wrapAssets('org_camera.png'),width: 75.rpx,height: 75.rpx,),
                Text(widget.text,style: TextStyle(color: Color(0xff999999),fontSize: 28.rpx),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

