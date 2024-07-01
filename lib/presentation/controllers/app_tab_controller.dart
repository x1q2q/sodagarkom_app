import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../presentation/bindings/home_binding.dart';
import '../../presentation/bindings/products_binding.dart';
import '../../presentation/bindings/transactions_binding.dart';
import '../bindings/profile_binding.dart';
import '../pages/home_page.dart';
import '../pages/products_page.dart';
import '../pages/transactions_page.dart';
import '../pages/profile_page.dart';

class AppTabController extends GetxController {
  static AppTabController get to => Get.find();

  var selectedIndex = 0.obs;
  final pages = <String>['/home', '/products', '/transactions', '/profile'];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changePage(int index) {
    selectedIndex.value = index;
    Get.toNamed(pages[index], id: 1);
  }

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/home':
        return GetPageRoute(
            settings: settings,
            page: () => const HomePage(),
            binding: HomeBinding());
      case '/products':
        return GetPageRoute(
            settings: settings,
            page: () => const ProductsPage(),
            binding: ProductsBinding());
      case '/transactions':
        return GetPageRoute(
            settings: settings,
            page: () => const TransactionsPage(),
            binding: TransactionsBinding());
      case '/profile':
        return GetPageRoute(
            settings: settings,
            page: () => const ProfilePage(),
            binding: ProfileBinding());
      default:
        return null;
    }
  }
}
