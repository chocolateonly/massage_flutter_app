import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:massageflutterapp/config/resouce_manager.dart';
import 'package:massageflutterapp/utils/size_fit.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:provider/provider.dart';
import 'package:massageflutterapp/view_model/global_model.dart';
import './CodeButton.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _phoneController=TextEditingController();
  var _passwordController =TextEditingController();
  bool isPsdLogin=true;
  InputDecoration getInputStyle(String placeholder){
    return InputDecoration(
        hintText: placeholder,
        // 隐藏边框
        border: InputBorder.none,
        // 设置背景色填充模式为-充满（fasle时无效）
        filled: true,
        // 设置背景色
        fillColor: Color(0xfff8f8f8),
        contentPadding: const EdgeInsets.all(14.0),
        enabledBorder: OutlineInputBorder(
          /*边角*/
          borderRadius: BorderRadius.all(
            Radius.circular(10), //边角为5
          ),
          borderSide: BorderSide(
            color: Colors.transparent, //边线颜色为白色
            width: 1, //边线宽度为2
          ),
        ),
        focusedBorder: OutlineInputBorder(
          /*边角*/
          borderRadius: BorderRadius.all(
            Radius.circular(10), //边角为5
          ),
          borderSide: BorderSide(
            color: Colors.transparent, //边线颜色为白色
            width: 1, //边线宽度为2
          ),
        )
    );
  }
  @override
  Widget build(BuildContext context) {

    var themeModel=Provider.of<GlobalModel>(context);
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      body:GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap:  (){
          //点击输入框以外的地方  收起键盘
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding:  EdgeInsets.only(bottom: 20.rpx),
                  child: Image.asset(ImageHelper.wrapAssets('login_logo.png'),width:286.rpx,height:185.rpx),
                ),
                Container(
                  width: 640.rpx,
                  height: 800.rpx,
                  decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(20.rpx)
                  ),
                  child: FormContent(context, themeModel),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding FormContent(BuildContext context, GlobalModel themeModel) {
    return Padding(
                  padding: EdgeInsets.all(30.rpx),
                  child: Column(
                    children: <Widget>[
                      Align(
                          alignment:Alignment.topLeft,
                          child: Text(S.of(context).login,style: TextStyle(fontSize: 36.rpx),textAlign: TextAlign.left,)
                      ),
                      SizedBox(height: 20.rpx),
                      TextField(
                        controller: _phoneController,
                        keyboardType:TextInputType.phone,
                        style:TextStyle(fontSize: 32.rpx,),
                        decoration:getInputStyle(S.of(context).phonePlaceholder),
                      ),
                      SizedBox(height: 20.rpx),

                      isPsdLogin ? TextField(
                        controller: _passwordController,
                        style:TextStyle(fontSize: 32.rpx,),
                        decoration:getInputStyle(S.of(context).passwordPlaceholder),
                      ):PhoneCodeButton(context),
                      SizedBox(height: 40.rpx),
                      Container(
                        width: double.maxFinite,
                        child: CupertinoButton(
                          color: themeModel.themeColor,
                          borderRadius:BorderRadius.circular(60.rpx),
                          onPressed: () {
                            //todo:登录处理
                          },
                          child: Text(S.of(context).login,style: TextStyle(color: Colors.white,fontSize: 30.rpx),),
                        ) ,
                      ),
                      SizedBox(height: 40.rpx),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          InkWell(
                            onTap: (){},
                            child: Text(S.of(context).registerUser,style: TextStyle(color: Color(0xff666666),fontSize: 26.rpx),),
                          ),
                          InkWell(
                            onTap: (){
                              setState(() {

                                isPsdLogin=!isPsdLogin;
                              });
                            },
                            child:isPsdLogin?
                            Text(S.of(context).messageLogin,style: TextStyle(color: Color(0xff666666),fontSize: 26.rpx),):
                            Text(S.of(context).passwordLogin,style: TextStyle(color: Color(0xff666666),fontSize: 26.rpx),),
                          ),
                          InkWell(
                            onTap: (){},
                            child: Text(S.of(context).forgetPassword,style: TextStyle(color: Color(0xffcccccc),fontSize: 26.rpx),),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.rpx,),
                      FooterView(context)
                    ],
                  ),
                );
  }

  var _phoneCodeController=TextEditingController();
  Widget PhoneCodeButton(BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          color:  Color(0xfff8f8f8),
          borderRadius: BorderRadius.all(
            Radius.circular(10), //边角为5
          ),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                child: TextField(
                  controller: _phoneCodeController,
                  style:TextStyle(fontSize: 32.rpx,),
                  decoration:getInputStyle(S.of(context).phoneCodePlaceholder),
                ),
              ),
            ),
            CodeButton()
          ],
        ),
      );
  }
}

Widget FooterView(BuildContext context) {
  return Column(
    children: <Widget>[
      Container(
        padding: EdgeInsets.all(20.rpx),
        child: Column(
          children: <Widget>[
            Padding(
              padding:EdgeInsets.only(bottom: 40.rpx),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        color: Color(0xff999999),
                        width:20,
                        height: 1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.rpx),
                        child: Text(S.of(context).thirdLogin,style: TextStyle(fontSize: 26.rpx,color: Color(0xff999999)),)),
                    Expanded(
                      child: Container(
                        color: Color(0xff999999),
                        width:20,
                        height: 1,
                      ),
                    ),
                  ],
              ),
            ),
            InkWell(
              onTap: (){
                //todo:
              },
                child: Image.asset(ImageHelper.wrapAssets("icon_facebook.png"), height: 100.rpx, width: 100.rpx)),
          ],
        ),
      )
    ],
  );
}
