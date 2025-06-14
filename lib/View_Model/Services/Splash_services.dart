
import 'dart:async';

import 'package:get/get.dart';


import '../../resource/App_routes/routes_name.dart';
import '../Controller/login/user_prefrrence/user_preference_view_model.dart';

class SplashServices{
  UserPreferences userPreferences=UserPreferences();

  void isLogin(){

    userPreferences.getUser().then((value) {
      print(value.token);
      if( value.token.toString()=="null"){
        //value.token!.isEmpty
        Timer(Duration(seconds: 5), () {
          Get.offNamed(RouteName.registerView);
        });
      }else{
        Timer(Duration(seconds: 3), () {
          Get.offNamed(RouteName.homeView);
        });
      }
    });
  }
}