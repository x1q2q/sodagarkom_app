import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../pages/home_page.dart';
import '../pages/products_page.dart';
import '../pages/transactions_page.dart';
import '../pages/profile_page.dart';

class AppTabController extends GetxController {
  static AppTabController get to => Get.find();

  var selectedIndex = 0.obs;

  final pages = [HomePage(), ProductsPage(), TransactionsPage(), ProfilePage()];

  Widget get currentPage => pages[selectedIndex()];
  void changePage(int index) {
    selectedIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
