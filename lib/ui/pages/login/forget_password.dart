import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:massageflutterapp/config/resouce_manager.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/ui/pages/login/CodeButton.dart';
import 'package:massageflutterapp/utils/size_fit.dart';
import 'package:provider/provider.dart';
import 'package:massageflutterapp/view_model/global_model.dart';
import 'package:massageflutterapp/ui/widgets/button/theme_button.dart';
class ForgetPasswordPage extends StatefulWidget {
  var type=0;//0为忘记密码，其他为修改密码

  ForgetPasswordPage(this.type);
  @override
  _ForgetPasswordPageState createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  var _phoneController=TextEditingController();
  var _phoneCodeController=TextEditingController();
  var _passwordController=TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var themeModel=Provider.of<GlobalModel>(context);
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.type==0?S.of(context).forgetPassword:S.of(context).changePassword),
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
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding:EdgeInsets.symmetric(vertical: 10.rpx),
                            decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Color(0xffeeeeee))
                              )
                            ),
                            child: TextField(
                            controller:_phoneController,
                            decoration: InputDecoration(
                              icon:Image.asset(ImageHelper.wrapAssets('icon_user_name.png'),width:40.rpx,height: 40.rpx,),
                              hintText: S.of(context).phonePlaceholder,//placeholder
                              // 隐藏边框
                              border: InputBorder.none,
                            ),
                            ),
                          ),
                          Container(
                            padding:EdgeInsets.symmetric(vertical: 10.rpx),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Color(0xffeeeeee))
                                )
                            ),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: TextField(
                                    controller:_phoneCodeController,
                                    decoration: InputDecoration(
                                      icon:Image.asset(ImageHelper.wrapAssets('icon_phone_code.png'),width:40.rpx,height: 40.rpx,),
                                      hintText: S.of(context).phoneCodePlaceholder,//placeholder
                                      // 隐藏边框
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                CodeButton(_phoneController.text)
                              ],
                            )
                          ),
                          Container(
                            padding:EdgeInsets.symmetric(vertical: 10.rpx),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.transparent)
                                )
                            ),
                            child: TextField(
                              controller:_passwordController,
                              decoration: InputDecoration(
                                icon:Image.asset(ImageHelper.wrapAssets('icon_user_name.png'),width:40.rpx,height: 40.rpx,),
                                hintText: S.of(context).passwordPlaceholder,//placeholder
                                // 隐藏边框
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      )
                  ),
                ),
              ),
              ThemeButton(
                  title: S.of(context).submit,
                  onPressed:(){
                    //todo:处理表单
                  }
              )
            ],
          ),
        ),
      ),
    );
  }
}
