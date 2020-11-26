import 'package:flutter/material.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/utils/size_fit.dart';
import 'package:massageflutterapp/ui/widgets/button/theme_button.dart';
import 'package:massageflutterapp/ui/widgets/form/form_item.dart';
class AddOrEditAddressPage extends StatefulWidget {
  var id='';
  AddOrEditAddressPage(this.id);
  @override
  _AddOrEditAddressPageState createState() => _AddOrEditAddressPageState();
}

class _AddOrEditAddressPageState extends State<AddOrEditAddressPage> {
  var _nameController=TextEditingController();
  var _accountController=TextEditingController();
  var _bankController=TextEditingController();
  var check=false;
  @override
  Widget build(BuildContext context) {
    var AddOrEditAddress=widget.id==''?"添加":"修改";
    var name="姓名";
    var mobile="电话";
    var area="所在区域";
    var addressDetail="详细地址";
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(AddOrEditAddress),
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
                          FormItem(label:mobile,controller:_accountController,inputType:TextInputType.number),
                          FormItem(label:area,controller:_bankController),
                          FormItem(label:addressDetail,controller:_bankController,maxLines: null,textAlign: TextAlign.left,),
                      CheckboxListTile(
                        title:  Text('设为默认'),
                        value: this.check,
                        onChanged: (bool value) {
                          setState(() {
                            this.check = !this.check;
                          });
                        },
                      )
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
