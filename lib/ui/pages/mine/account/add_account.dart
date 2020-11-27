import 'package:flutter/material.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/utils/size_fit.dart';
import 'package:massageflutterapp/ui/widgets/button/theme_button.dart';
import 'package:massageflutterapp/ui/widgets/form/form_item.dart';
class AddAccountPage extends StatefulWidget {
  var id;

  AddAccountPage(this.id);
  @override
  _AddAccountPageState createState() => _AddAccountPageState();
}

class _AddAccountPageState extends State<AddAccountPage> {
  var _nameController=TextEditingController();
  var _accountController=TextEditingController();
  var _bankController=TextEditingController();
  var check=false;
  @override
  Widget build(BuildContext context) {
    var AddAccount=S.of(context).addAccount;
    var name=S.of(context).name;
    var account=S.of(context).bankCard;
    var bank=S.of(context).bankName;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(AddAccount),
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
                        children: <Widget>[
                          FormItem(label:name,controller:_nameController),
                          FormItem(label:account,controller:_accountController,inputType:TextInputType.number),
                          FormItem(label:bank,controller:_bankController),
                         InkWell(
                           onTap: () {
                             setState(() {
                               check = !check;
                             });
                           },
                           child: Row(
                             children: <Widget>[
                               Container(
                                   child: checkIcon(),
                                   padding:EdgeInsets.symmetric(vertical:20.rpx,horizontal: 10.rpx)
                               ),
                               Text(S.of(context).setDefault,style:TextStyle(color:Color(0xff666666) )),
                             ],
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

  Widget checkIcon() {
    return InkWell(
      child: !check
          ? Icon(
        Icons.check_circle_outline,
        size: 20.px,
        color: Colors.grey,
      )
          : Icon(
        Icons.check_circle,
        size: 20.px,
        color: Theme.of(context).accentColor,
      ),
      onTap: () {
        setState(() {
          check = !check;
        });
      },
    );
  }
}
