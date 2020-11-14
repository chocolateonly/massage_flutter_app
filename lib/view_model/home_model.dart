import 'package:flutter/cupertino.dart';

class HomeModel extends ChangeNotifier{
   //  mock
   List _homeType=['home_type1.png','home_type2.png','home_type3.png','home_type4.png'];
   List _banners = ['home_banner.png'];

   List get homeType=>_homeType;
   List get banners=>_banners;

   Future<bool> loadHome() async {
     try {
       print('load home');
       return true;
     } catch (e, s) {

       return false;
     }
   }

}