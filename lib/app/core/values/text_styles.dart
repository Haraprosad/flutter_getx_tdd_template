
import 'package:flutter/material.dart';
import 'package:flutter_getx_tdd_template/app/core/values/app_colors.dart';

abstract class AppTextStyles{
  static const pageTitleStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      height: 1.15,
      color: AppColors.appBarTextColor);

  static const cardTitleStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      height: 1.2,
      color: AppColors.textColorPrimary);

  static const cardTitleCyanStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: AppColors.pageBackground,
  );

  static const cardSubtitleStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      height: 1.2,
      color: AppColors.textColorGreyLight);
}