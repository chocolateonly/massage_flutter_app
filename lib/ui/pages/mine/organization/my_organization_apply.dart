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
class MyOrganizationApplyPage extends StatefulWidget {

  @override
  _MyOrganizationApplyPageState createState() => _MyOrganizationApplyPageState();
}

class _MyOrganizationApplyPageState extends State<MyOrganizationApplyPage> {
  var _nameController=TextEditingController();
  var _usernameController=TextEditingController();
  var _mobileController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('机构入驻'),
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
                child: Text('为保证您的利益，请如实填写以下信息',style: TextStyle(color: Theme.of(context).accentColor,fontSize: 30.rpx),textAlign: TextAlign.left,),
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
                            FormItem(label:'机构名称',controller:_nameController,isRequired:true,textColor:0xff333333),
                            FormItem(label:'负责人姓名',controller:_usernameController,isRequired:true,textColor:0xff333333),
                            FormItem(label:'联系方式',controller:_mobileController,isRequired:true,textColor:0xff333333),
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
                                            children: <Widget>[Text("*",style: TextStyle(color: Colors.red),), Text('资料附件',style: TextStyle(color: Color(0xff333333),fontSize: 30.rpx),)
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
                                            child: Text('附件下载',style: TextStyle(color: Theme.of(context).accentColor,fontSize: 26.rpx),),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  UploadPictureWidget(
                                    list: List.generate(1, (index) => ImageHelper.img),
                                    callback: (){
                                      print('callback');
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
                                              Text('负责人身份证正反面照',style: TextStyle(color: Color(0xff333333),fontSize: 30.rpx),)
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  UploadPictureWidget(
                                    list: List.generate(1, (index) => ImageHelper.img),
                                    callback: (){
                                      print('callback');
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
                                              Text('营业执照（选填）',style: TextStyle(color: Color(0xff333333),fontSize: 30.rpx),)
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  UploadPictureWidget(
                                    list: List.generate(1, (index) => ImageHelper.img),
                                    callback: (){
                                      print('callback');
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
                              child:Container(
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
                                      child:  Text('资料提交成功， 结果将在1-2工作日反馈！',
                                        style: TextStyle(color: Color(0xff4d4d4d),fontSize: 32.rpx),textAlign: TextAlign.center,),
                                    ),
                                Container(
                                width: 480.rpx,
                                child: ThemeButton(
                                  title:'我知道了',
                                  onPressed: (){
                                       Navigator.of(context).pop();
                                  },
                                ),
                              ),
                                  ],
                                ),
                              )
                          );
                        }
                    );
                  }
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('点击提交，即表示您已同意',style: TextStyle(color: Color(0xff999999),fontSize: 26.rpx)),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).pushNamed(RouteName.applyWord,arguments: ['《机构入驻协议》',1]);
                    },
                    child: Text('《机构入驻协议》',style: TextStyle(color:Theme.of(context).accentColor,fontSize: 26.rpx),),
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
