import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/utils/size_fit.dart';
import 'package:massageflutterapp/config/resouce_manager.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:massageflutterapp/ui/widges/form/form_item.dart';
class MyInfoPage extends StatefulWidget {

  @override
  _MyInfoPageState createState() => _MyInfoPageState();
}

class _MyInfoPageState extends State<MyInfoPage> {
  var _idController=TextEditingController(text: 'ididid');
  var _phoneController=TextEditingController();
  var _addressController=TextEditingController(text: '呵呵哈哈哈还是地方还是东方红华东师范is的哈佛史蒂芬斯哦好的覅哦');
  Widget imgWidth;


  @override
  void initState() {
    // TODO: implement initState
    _phoneController.text='123456';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List sexList=[
      S.of(context).female,
      S.of(context).male
    ];
    var _newValue=0;

/*
    List<Widget> getRadioList() {
      var list = [];

      sexList.forEach((item) {
        list.add(RadioListTile(
          title: sexList[0],
          value: sexList[0],
          groupValue: _newValue,
          onChanged: (index) {
            setState(() {
              print(index);
              _newValue = index;
            });
          },
        ));
      });
      return list;
    }
* */


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
                                  //todo:更换图片
                                    uploadImages();
                                },
                                child: Row(
                                  children: <Widget>[
                                    Text(S.of(context).avatar,style: TextStyle(color: Color(0xff666666)),),
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                          padding: EdgeInsets.symmetric(vertical: 5),
                                          child: ClipOval(
                                            child: imgWidth,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                          ),
                          FormItem(label:S.of(context).ID,controller:_idController,readOnly: true,),
                          FormItem(label:S.of(context).mobile,controller:_phoneController,inputType:TextInputType.phone),
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Color(0xffeeeeee))
                                )
                            ),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width:100.rpx,
                                  child:  Text(S.of(context).sex,style: TextStyle(color: Color(0xff666666)),),
                                ),
                                Expanded(
                                  child: Row(
                                    children: <Widget>[


                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          FormItem(label:S.of(context).address,controller:_addressController,textAlign:TextAlign.left,inputType:TextInputType.multiline,maxLines:null),
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
                        print(_phoneController.text);
                    }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  List<Asset> images = List<Asset>();
  String _error='';
  Future<void> uploadImages() async {
    List<Asset> resultList = List<Asset>();
    String error = 'No Error Dectected';

    try {
      resultList = await MultiImagePicker.pickImages(
        // 选择图片的最大数量
        maxImages: 1,
        // 是否支持拍照
        enableCamera: true,
        materialOptions: MaterialOptions(
          // 显示所有照片，值为 false 时显示相册
            startInAllView: true,
            allViewTitle: '所有照片',
            textOnNothingSelected: '没有选择照片'),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    if(resultList.length!=0){
      // 获取 ByteData
      ByteData byteData = await images[0].getByteData();
      List<int> imageData = byteData.buffer.asUint8List();

      //上传图片
      //TODO:uploader_model
      setState(() {

      });

    }

  }
}

