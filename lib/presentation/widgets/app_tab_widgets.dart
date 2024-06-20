import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '.../../../controllers/app_tab_controller.dart';
import '../../core/colors.dart';
import '../../core/styles.dart';
import 'app_svg.dart';

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
                    activeIcon: contIconTabs(AppSvg.homeActiveTabs),
                    icon: contIconTabs(AppSvg.homeTabs),
                    label: 'Beranda',
                    tooltip: 'Beranda Aplikasi'),
                BottomNavigationBarItem(
                    activeIcon: contIconTabs(AppSvg.productsActiveTabs),
                    icon: contIconTabs(AppSvg.productsTabs),
                    label: 'Produk',
                    tooltip: 'Semua Produk'),
                BottomNavigationBarItem(
                    backgroundColor: AppColors.purplev1,
                    activeIcon: contIconTabs(AppSvg.transactionsActiveTabs),
                    icon: contIconTabs(AppSvg.transactionsTabs),
                    label: 'Transaksi',
                    tooltip: 'Transaksi Order'),
                BottomNavigationBarItem(
                    activeIcon: contIconTabs(AppSvg.profileActiveTabs),
                    icon: contIconTabs(AppSvg.profileTabs),
                    label: 'Profil',
                    tooltip: 'Profil Pengguna'),
              ],
              currentIndex: controller.selectedIndex.value,
              unselectedItemColor: AppColors.redv1,
              selectedItemColor: AppColors.redv2,
              selectedLabelStyle: AppStyles.tabsSelected,
              unselectedLabelStyle: AppStyles.tabsUnselected,
              onTap: controller.changePage,
              type: BottomNavigationBarType.fixed,
            ))));
  }

  Widget contIconTabs(Widget svg) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 3),
        child: svg,
        width: 30,
        height: 30);
  }
}
