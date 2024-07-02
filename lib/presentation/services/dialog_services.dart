import 'package:flutter/material.dart';
import '../../core/colors.dart';
import 'package:get/get.dart';

class DialogService {
  static SnackbarController showToast(String title, String message) {
    return Get.snackbar(title, message,
        margin: const EdgeInsets.only(top: 15, right: 10, left: 10),
        backgroundColor:
            title == 'success' ? AppColors.lightgreen : AppColors.redv2,
        colorText: title == 'success' ? AppColors.greenv1 : Colors.white);
  }

  static SnackbarController rawToast(String msg) {
    return Get.rawSnackbar(
        message: msg,
        maxWidth: Get.width,
        backgroundColor: AppColors.blackv2,
        snackPosition: SnackPosition.BOTTOM);
  }

  static SnackbarController topToast(String color, String msg) {
    return Get.rawSnackbar(
        message: msg,
        borderRadius: 8,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        duration: const Duration(seconds: 2),
        animationDuration: const Duration(milliseconds: 500),
        maxWidth: Get.width,
        backgroundColor: (color == 'red')
            ? AppColors.redv2
            : (color == 'yellow')
                ? AppColors.lightyellow
                : (color == 'green')
                    ? AppColors.lightgreen
                    : AppColors.blackv2,
        snackPosition: SnackPosition.TOP);
  }

  static SnackbarController toastAuth(String title, String message) {
    return Get.snackbar(title, message,
        margin: const EdgeInsets.only(top: 15, right: 10, left: 10),
        backgroundColor:
            title == 'success' ? AppColors.lightgreen : AppColors.redv1,
        colorText: title == 'success'
            ? const Color.fromRGBO(4, 108, 78, 1)
            : AppColors.redv3);
  }
}
