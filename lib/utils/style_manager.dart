import 'package:flutter/material.dart';

import 'colors_manager.dart';

abstract class StyleManager {
  // title
  static const titleStyle36 = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
  );

  // subtitle, form field, (switch, check box title)
  static const textStyleDark24 = TextStyle(
    fontSize: 24,
    color: ColorsManager.black,
  );

   static const textStylePrimary24 = TextStyle(
      fontSize: 24, fontWeight: FontWeight.bold, color: ColorsManager.primary);


   static const textStyleLight30 = TextStyle(
      fontSize: 30, fontWeight: FontWeight.bold, color: ColorsManager.white);

   static const textStyleDark30 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );

   static const textStyleDark18 =
      TextStyle(fontSize: 18, color: ColorsManager.black);

   static const textStyleLight18 = TextStyle(
      fontSize: 18, fontWeight: FontWeight.bold, color: ColorsManager.white);

  static const textStyleDark16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold
  );

  static const textStyle16 = TextStyle(
    fontSize: 16,
      fontWeight: FontWeight.bold,
    color: ColorsManager.white

  );

   static const textStyle14 = TextStyle(
      fontSize: 14, fontWeight: FontWeight.bold, color: ColorsManager.white);

   static const textStyleDark14 = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: ColorsManager.black
  );

   static TextStyle textStyleDarkOP12 = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w100,
       color: ColorsManager.black.withOpacity(0.65),
  );

   static const textStyle20 = TextStyle(
    fontSize: 20,
    color: ColorsManager.black,
     fontWeight: FontWeight.bold
  );

  static TextStyle textStyleDarkOP16 = TextStyle(
      fontSize: 16,
       color: ColorsManager.black.withOpacity(0.65));

  static const RoundedRectangleBorder appBarShape =  RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)));
}
