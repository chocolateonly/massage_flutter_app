import 'package:massageflutterapp/config/storage_manager.dart';
import 'package:massageflutterapp/view_model/locale_model.dart';
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