import 'package:flutter/material.dart';
import 'colors.dart';

class AppStyles {
  static const TextStyle labelAppName = TextStyle(
      fontFamily: 'PlusJakarta',
      fontWeight: FontWeight.w600,
      color: AppColors.blackv1,
      fontSize: 30);

  static const TextStyle searchBarField = TextStyle(
      fontFamily: 'PlusJakarta',
      fontWeight: FontWeight.w400,
      color: AppColors.grayv1,
      fontSize: 20);

  static const Widget vSpaceXSmall = SizedBox(height: 5.0);
  static const Widget vSpaceSmall = SizedBox(height: 15.0);
  static const Widget vSpaceMedium = SizedBox(height: 35.0);
  static const Widget vSpaceLarge = SizedBox(height: 50.0);
}
