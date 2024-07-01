import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '.../../../controllers/app_tab_controller.dart';
import '../../core/colors.dart';
import '../../core/styles.dart';
import 'app_svg.dart';

class AppTab extends GetView<AppTabController> {
  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
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
            bottomNavigationBar: Obx(() => BottomNavigationBar(
                  elevation: 3.0,
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
        margin: EdgeInsets.symmetric(vertical: 2),
        width: 25,
        height: 25,
        child: svg);
  }
}
