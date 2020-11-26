import 'package:massageflutterapp/config/storage_manager.dart';
import 'package:massageflutterapp/view_model/locale_model.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:flutter/services.dart';
import 'package:massageflutterapp/generated/l10n.dart';
class ImageHelper{
  static const String baseUrl = 'http://www.meetingplus.cn';
  static const String imagePrefix = '$baseUrl/uimg/';
  static const String img ="https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1256863125,2563728258&fm=26&gp=0.jpg";
  static String wrapUrl(String url) {
    if (url.startsWith('http')) {
      return url;
    }else{}
    return imagePrefix + url;
  }

  static String wrapAssets(String url) {
    return "assets/img/" + url;
  }
}

 String getLanguage(context) {
int _localeIndex = StorageManager.sharedPreferences.getInt(LocaleModel.kLocaleIndex) ?? 0;
return LocaleModel.localeName(_localeIndex, context);
}

Future<List> uploadImages(context,max) async {
  List<Asset> images = List<Asset>();
  List<Asset> resultList = List<Asset>();
  String error = 'No Error Dectected';

  try {
    resultList = await MultiImagePicker.pickImages(
      // 选择图片的最大数量
      maxImages: max,
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
    return imageData;

  }

}