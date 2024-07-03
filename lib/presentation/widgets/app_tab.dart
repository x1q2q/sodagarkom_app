import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '.../../../controllers/app_tab_controller.dart';
import '../../core/colors.dart';
import 'app_svg.dart';

class AppTab extends GetView<AppTabController> {
  const AppTab({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Navigator(
              key: Get.nestedKey(1),
              initialRoute: '/home',
              onGenerateRoute: controller.onGenerateRoute,
            ),
            bottomNavigationBar: Obx(() => Container(
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(color: AppColors.grayv1, offset: Offset(0, -0.2))
                ]),
                child: NavigationBar(
                  height: 65,
                  onDestinationSelected: (int index) {
                    controller.changePage(index);
                  },
                  surfaceTintColor: Colors.white,
                  backgroundColor: Colors.white,
                  indicatorColor: AppColors.lightred,
                  selectedIndex: controller.selectedIndex.value,
                  destinations: <Widget>[
                    NavigationDestination(
                        selectedIcon: contIconTabs(AppSvg.homeActiveTabs),
                        icon: contIconTabs(AppSvg.homeTabs),
                        label: 'Beranda',
                        tooltip: 'Beranda Aplikasi'),
                    NavigationDestination(
                        selectedIcon: contIconTabs(AppSvg.productsActiveTabs),
                        icon: contIconTabs(AppSvg.productsTabs),
                        label: 'Produk',
                        tooltip: 'Semua Produk'),
                    NavigationDestination(
                        selectedIcon:
                            contIconTabs(AppSvg.transactionsActiveTabs),
                        icon: contIconTabs(AppSvg.transactionsTabs),
                        label: 'Transaksi',
                        tooltip: 'Transaksi Order'),
                    NavigationDestination(
                        selectedIcon: contIconTabs(AppSvg.profileActiveTabs),
                        icon: contIconTabs(AppSvg.profileTabs),
                        label: 'Profil',
                        tooltip: 'Profil Pengguna'),
                  ],
                )))));
  }

  Widget contIconTabs(Widget svg) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 3),
        width: 26,
        height: 26,
        child: svg);
  }
}
