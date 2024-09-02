import 'dart:math';

import 'package:nb_utils/nb_utils.dart' as nb;

/// get current locale language code
String getLanguageCode() {
  return nb.getContext.languageCode ?? "en";
}

/// get current user api token
String getUserToken() {
  return nb.getStringAsync("user_token", defaultValue: "");
}

/// set current user api token
Future<bool> setUserToken(String token) {
  return nb.setValue("user_token", token);
}

/// delete current user api token
Future<bool> deleteUserToken() {
  return nb.removeKey("user_token");
}

/// get if app is rtl
bool isRTL() {
  return nb.getContext.locale.languageCode
          .toLowerCase() ==
      "ar";
}

List<T>? getApiListData<T>(
    Map<String, dynamic>? data, T Function(Map<String, dynamic>) fromJson) {
  List<dynamic> dataList = data?['data'] ?? [];
  return dataList.map((item) => fromJson(item)).toList();
}

T? getApiObjectData<T>(
    Map<String, dynamic>? data, T Function(Map<String, dynamic> data) fromJson) {
  if(data == null){
    return null;
  }

  return fromJson(data['data'] ?? {});
}


String generateRandomHexColor() {
  final random = Random.secure();
  // Generate a random integer value between 0 and 0xFFFFFF (16777215 in decimal)
  final int randomColorValue = random.nextInt(0xFFFFFF);
  // Convert the integer value to a hexadecimal string and pad it with zeros if necessary
  return '#${randomColorValue.toRadixString(16).padLeft(6, '0').toUpperCase()}';
}