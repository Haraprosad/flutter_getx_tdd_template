import 'package:flutter/material.dart';

abstract class AppColors{

  ///general color name
  static const milkWhite = Color(0xFFFAFBFD);
  static const blueBayoux = Color(0xff38686A);
  static Color greyWithOpacityHalf = Colors.grey.withOpacity(0.5);

  ///theme color
  static const pageBackground = milkWhite;
  static const Color colorAccent = blueBayoux;
  static const Color defaultRippleColor = Color(0x0338686A);

  ///common widget color
  static const loading = blueBayoux;


  ///bar color
  static const Color appBarColor = Color(0xFF38686A);
  static const Color appBarIconColor = Color(0xFFFFFFFF);
  static const Color appBarTextColor = Color(0xFFFFFFFF);


  ///icon color
  static const Color iconColorDefault = Colors.grey;


  ///button color
  static Color elevatedContainerColorOpacity = greyWithOpacityHalf;


  ///text color
  static const Color textColorPrimary = Color(0xFF323232);
  static const Color textColorSecondary = Color(0xFF9FA4B0);
  static const Color textColorTag = pageBackground;
  static const Color textColorGreyLight = Color(0xFFABABAB);
  static const Color textColorGreyDark = Color(0xFF979797);
  static const Color textColorBlueGreyDark = Color(0xFF939699);
  static const Color textColorCyan = Color(0xFF38686A);
  static const Color textColorWhite = Color(0xFFFFFFFF);
  static Color searchFieldTextColor = const Color(0xFF323232).withOpacity(0.5);

}