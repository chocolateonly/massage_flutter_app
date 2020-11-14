import 'package:massageflutterapp/config/storage_manager.dart';
import 'package:massageflutterapp/view_model/locale_model.dart';
class ImageHelper{
  static String wrapAssets(String url) {
    return "assets/img/" + url;
  }

}

 String getLanguage(context) {
int _localeIndex = StorageManager.sharedPreferences.getInt(LocaleModel.kLocaleIndex) ?? 0;
return LocaleModel.localeName(_localeIndex, context);
}