import 'package:flutter/material.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/utils/size_fit.dart';
import 'package:massageflutterapp/ui/widgets/button/theme_button.dart';
import 'package:massageflutterapp/ui/widgets/form/form_item.dart';
import 'package:massageflutterapp/ui/widgets/picker/area_picker.dart';
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
  var address='';
  Map selectArea;
  ///接收选择的结果
  void handleSelect (Map targetArea) {
    setState(() {
      selectArea = targetArea;
    });
  }
  @override
  Widget build(BuildContext context) {
    var AddOrEditAddress=widget.id==''?S.of(context).add:S.of(context).edit;
    var name=S.of(context).name;
    var mobile=S.of(context).mobile;
    var area=S.of(context).area;
    var addressDetail=S.of(context).detailAddress;
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
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom:BorderSide(color: Color(0xffeeeeee))
                                )
                            ),
                            child: InkWell(
                              onTap: (){
                                showModalBottomSheet(context: context, builder: (_)=>Container(
                                  height: 300.0,
                                  child: AreaSelection(
                                    onSelect: handleSelect,
                                    initProviceIndex: selectArea == null ? 0 : selectArea['proviceIndex'],
                                    initCityIndex: selectArea == null ? 0 : selectArea['cityIndex'],
                                    initCountyIndex: selectArea == null ? 0 : selectArea['countyIndex'],
                                  ),
                                ));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      padding:EdgeInsets.symmetric(vertical: 20.rpx),
                                      child:Text(address==''?area:address,style: TextStyle(color: Color(0xff666666),fontSize: 26.rpx),overflow: TextOverflow.ellipsis,),
                                    ),
                                  ),
                                  Icon( Icons.arrow_forward_ios,color: Color(0xff999999),size: 16,)
                                ],
                              ),
                            ),

                          ),
                          FormItem(label:addressDetail,controller:_bankController,maxLines: null,textAlign: TextAlign.left,),
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
