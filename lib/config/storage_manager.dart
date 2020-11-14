import 'package:localstorage/localstorage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageManager{
  static LocalStorage localStorage;
  static SharedPreferences sharedPreferences;

  static init() async{
    localStorage = LocalStorage('LocalStorage'); //获取本地存储的数据
    sharedPreferences = await SharedPreferences.getInstance();//实例化
  }
}