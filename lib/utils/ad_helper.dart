import 'dart:io';

import 'package:flutter/foundation.dart';

class ADHelper{

  static const String _appIdAndroid = "ca-app-pub-8358917442541077~6554742357";

  static const String _adRewardAndroidDebug = "ca-app-pub-3940256099942544/5224354917";
  static const String _adFullAndroidDebug = "ca-app-pub-3940256099942544/1033173712";
  static const String _adBannerAndroidDebug = "ca-app-pub-3940256099942544/6300978111";

  static const String _adRewardAndroid = "ca-app-pub-8358917442541077/3753319197";
  static const String _adFullAndroid = "ca-app-pub-8358917442541077/3837079672" ;
  static const String _adBannerAndroid = "ca-app-pub-8358917442541077/2304506155";


  static  String  adFull (){
    if(Platform.isAndroid){
      if(kDebugMode){
        return _adFullAndroidDebug;
      }else{
        return _adFullAndroid;
      }
    }else{
      throw UnsupportedError("Ads Not Supported");
    }
  }

  static  String  adBanner (){
    if(Platform.isAndroid){
      if(kDebugMode){
        return _adBannerAndroidDebug;
      }else{
        return _adBannerAndroid;
      }
    }else{
      throw UnsupportedError("Ads Not Supported");
    }

  }

  static  String  adReward () {
    if(Platform.isAndroid){
      if(kDebugMode){
        return _adRewardAndroidDebug;
      }else{
        return _adRewardAndroid;
      }
    }else{
      throw UnsupportedError("Ads Not Supported");
    }
  }
}