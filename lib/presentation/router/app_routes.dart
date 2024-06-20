import 'package:get/get.dart';
import '../widgets/app_tab_widgets.dart';
import '../bindings/tabs_binding.dart';
import '../bindings/home_binding.dart';
import '../pages/product_detail_page.dart';

class AppRoutes {
  static const String appTab = '/app-tab';
  static const String home = '/home';
  static const String product = '/products';
  static const String transaction = '/transactions';
  static const String profile = '/profile';
  static const String productDetail = '/product-detail';

  static final routes = [
    GetPage(name: appTab, page: () => AppTabWidgets(0), binding: TabsBinding()),
    GetPage(name: home, page: () => AppTabWidgets(1), binding: HomeBinding()),
    GetPage(name: product, page: () => AppTabWidgets(2)),
    GetPage(name: transaction, page: () => AppTabWidgets(3)),
    GetPage(name: profile, page: () => AppTabWidgets(4)),
    GetPage(name: productDetail, page: () => ProductDetailPage()),
  ];
}
