import 'package:flutter/material.dart';
import 'colors.dart';

class AppStyles {
  static const TextStyle tabsUnselected = TextStyle(
      fontFamily: 'PlusJakarta',
      fontWeight: FontWeight.w500,
      color: AppColors.redv2,
      fontSize: 12);

  static const TextStyle tabsSelected = TextStyle(
      fontFamily: 'PlusJakarta',
      fontWeight: FontWeight.w800,
      color: AppColors.redv3,
      fontSize: 13);

  static const TextStyle labelAppName = TextStyle(
      fontFamily: 'PlusJakarta',
      fontWeight: FontWeight.w700,
      color: AppColors.blackv1,
      fontSize: 24);

  static const TextStyle cartItems = TextStyle(
      fontFamily: 'PlusJakarta',
      fontWeight: FontWeight.w700,
      color: Colors.white,
      fontSize: 12);

  static const TextStyle searchBarField = TextStyle(
      fontFamily: 'PlusJakarta',
      fontWeight: FontWeight.w400,
      color: AppColors.grayv1,
      fontSize: 18);

  static const TextStyle labelCategory = TextStyle(
      fontFamily: 'PlusJakarta',
      fontWeight: FontWeight.w700,
      color: Colors.white,
      fontSize: 26);

  static const TextStyle labelCategoryPurple = TextStyle(
      fontFamily: 'PlusJakarta',
      fontWeight: FontWeight.w800,
      color: AppColors.purplev1,
      fontSize: 20);

  static const TextStyle btnTxtCardCategory = TextStyle(
      fontFamily: 'PlusJakarta',
      fontWeight: FontWeight.w500,
      color: AppColors.purplev1,
      fontSize: 15);

  static const TextStyle labelSection = TextStyle(
      fontFamily: 'PlusJakarta',
      fontWeight: FontWeight.w600,
      color: AppColors.blackv2,
      fontSize: 19);
  static const TextStyle productNameGrid = TextStyle(
      fontFamily: 'PlusJakarta',
      fontWeight: FontWeight.w600,
      color: AppColors.blackv1,
      fontSize: 14);
  static const TextStyle productPriceGrid = TextStyle(
      fontFamily: 'PlusJakarta',
      fontWeight: FontWeight.w800,
      color: AppColors.blackv2,
      fontSize: 15);
  static const TextStyle labelNavbar = TextStyle(
      fontFamily: 'PlusJakarta',
      fontWeight: FontWeight.w700,
      color: Colors.white,
      fontSize: 18);

  static const TextStyle productNameTile = TextStyle(
      fontFamily: 'PlusJakarta',
      fontWeight: FontWeight.w600,
      color: AppColors.blackv1,
      fontSize: 16);
  static const TextStyle productPriceTile = TextStyle(
      fontFamily: 'PlusJakarta',
      fontWeight: FontWeight.w800,
      color: AppColors.blackv2,
      fontSize: 17);

  static const TextStyle txtDropdown = TextStyle(
      fontFamily: 'PlusJakarta',
      fontWeight: FontWeight.w600,
      color: AppColors.blackv2,
      fontSize: 14);
  static const TextStyle txtDropdownDisabled = TextStyle(
      fontFamily: 'PlusJakarta',
      fontWeight: FontWeight.w600,
      color: AppColors.grayv1,
      fontSize: 14);

  static const TextStyle trxProductName = TextStyle(
      fontFamily: 'PlusJakarta',
      fontWeight: FontWeight.w700,
      color: AppColors.blackv2,
      fontSize: 15);
  static const TextStyle trxProductDesc = TextStyle(
      fontFamily: 'PlusJakarta',
      fontWeight: FontWeight.w500,
      color: AppColors.blackv1,
      fontSize: 14);
  static const TextStyle trxCode = TextStyle(
      fontFamily: 'PlusJakarta',
      fontWeight: FontWeight.w700,
      color: AppColors.blackv2,
      fontSize: 13);
  static const TextStyle trxDate = TextStyle(
      fontFamily: 'PlusJakarta',
      fontWeight: FontWeight.w500,
      color: AppColors.blackv1,
      fontSize: 13);

  static const TextStyle dialogTitle = TextStyle(
      fontFamily: 'PlusJakarta',
      fontWeight: FontWeight.w600,
      color: AppColors.blackv2,
      fontSize: 17);

  static const TextStyle dialogContent = TextStyle(
      fontFamily: 'PlusJakarta',
      fontWeight: FontWeight.w400,
      color: AppColors.blackv1,
      fontSize: 14);

  static ButtonStyle btnOutlineCancel = OutlinedButton.styleFrom(
    side: BorderSide(width: 1, color: AppColors.redv2),
    minimumSize: Size(70, 40),
    backgroundColor: AppColors.lightred,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  );
  static ButtonStyle btnSmElevatedPurple = ElevatedButton.styleFrom(
    minimumSize: Size(70, 40),
    foregroundColor: Colors.white,
    backgroundColor: AppColors.purplev1,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  );
  static ButtonStyle btnElevatedPurple = ElevatedButton.styleFrom(
    minimumSize: Size(80, 50),
    foregroundColor: Colors.white,
    backgroundColor: AppColors.purplev1,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  );

  static ButtonStyle btnElevatedRed = ElevatedButton.styleFrom(
    minimumSize: Size(80, 50),
    foregroundColor: Colors.white,
    backgroundColor: AppColors.redv2,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  );

  static ButtonStyle btnOutinePurple = OutlinedButton.styleFrom(
    side: BorderSide(width: 1, color: AppColors.purplev1),
    minimumSize: Size(80, 50),
    foregroundColor: AppColors.purplev1,
    backgroundColor: AppColors.lightred,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  );

  static const TextStyle btnTxtPurple = TextStyle(
      fontFamily: 'PlusJakarta',
      fontWeight: FontWeight.w600,
      color: AppColors.purplev1,
      fontSize: 16);

  static const TextStyle btnTxtWhite = TextStyle(
      fontFamily: 'PlusJakarta',
      fontWeight: FontWeight.w600,
      color: Colors.white,
      fontSize: 16);

  static const TextStyle btnSmTxtWhite = TextStyle(
      fontFamily: 'PlusJakarta',
      fontWeight: FontWeight.w600,
      color: Colors.white,
      fontSize: 13);

  static const TextStyle btnTxtPink = TextStyle(
      fontFamily: 'PlusJakarta',
      fontWeight: FontWeight.w600,
      color: AppColors.redv2,
      fontSize: 13);

  static const TextStyle fieldLabelKey = TextStyle(
      fontFamily: 'PlusJakarta',
      fontWeight: FontWeight.w700,
      color: AppColors.blackv1,
      fontSize: 14);

  static const TextStyle fieldLabelVal = TextStyle(
      fontFamily: 'PlusJakarta',
      fontWeight: FontWeight.w500,
      color: AppColors.blackv1,
      fontSize: 14);

  static const TextStyle txtRedPrice = TextStyle(
      fontFamily: 'PlusJakarta',
      fontWeight: FontWeight.w700,
      color: AppColors.redv2,
      fontSize: 20);

  static const TextStyle fieldInput = TextStyle(
      fontFamily: 'PlusJakarta',
      fontWeight: FontWeight.w500,
      color: AppColors.grayv1,
      fontSize: 14);

  static const TextStyle txtWTitle = TextStyle(
      fontFamily: 'PlusJakarta',
      fontWeight: FontWeight.w700,
      color: Colors.white,
      fontSize: 20);
  static const TextStyle txtWDesc = TextStyle(
      fontFamily: 'PlusJakarta',
      fontWeight: FontWeight.w300,
      color: Colors.white,
      fontSize: 16);

  static const TextStyle btnAuth = TextStyle(
      fontFamily: 'PlusJakarta',
      fontWeight: FontWeight.w700,
      color: Colors.white,
      letterSpacing: 0.6,
      fontSize: 17);

  static const Widget vSpaceXSmall = SizedBox(height: 5.0);
  static const Widget vSpaceSmall = SizedBox(height: 15.0);
  static const Widget vSpaceMedium = SizedBox(height: 35.0);
  static const Widget vSpaceLarge = SizedBox(height: 50.0);
}
