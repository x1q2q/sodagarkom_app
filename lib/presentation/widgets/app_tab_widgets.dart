import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '.../../../controllers/app_tab_controller.dart';
import '../../core/colors.dart';

class AppTabWidgets extends GetView<AppTabController> {
  AppTabWidgets(int index) {
    controller.changePage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        body: controller.currentPage,
        bottomNavigationBar: Obx(() => BottomNavigationBar(
              elevation: 2.0,
              backgroundColor: AppColors.lightred,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Beranda',
                    tooltip: 'Beranda Aplikasi'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.library_add),
                    label: 'Produk',
                    tooltip: 'Produk Aplikasi'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.abc_outlined),
                    label: 'Transaksi',
                    tooltip: 'Transaksi Aplikasi'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.access_alarm),
                    label: 'Profil',
                    tooltip: 'Profil Aplikasi'),
              ],
              currentIndex: controller.selectedIndex.value,
              unselectedItemColor: AppColors.redv1,
              selectedItemColor: AppColors.redv2,
              selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
              onTap: controller.changePage,
              type: BottomNavigationBarType.fixed,
            ))));
  }
}
