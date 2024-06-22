import 'package:get/get.dart';
import '../widgets/app_tab_widgets.dart';
import '../bindings/tabs_binding.dart';
import '../bindings/home_binding.dart';
import '../bindings/category_detail_binding.dart';
import '../pages/product_detail_page.dart';
import '../pages/category_detail_page.dart';
import '../pages/home_page.dart';
import '../pages/products_page.dart';
import '../pages/transactions_page.dart';
import '../pages/profile_page.dart';

class AppRoutes {
  static const String appTab = '/app-tab';
  static const String home = '/home';
  static const String product = '/products';
  static const String transaction = '/transactions';
  static const String profile = '/profile';
  static const String categoryDetail = '/category-detail/:id';
  static const String productDetail = '/product-detail/:id';

  static final routes = [
    GetPage(name: appTab, page: () => AppTabWidgets(), binding: TabsBinding()),
    GetPage(name: home, page: () => HomePage(), binding: HomeBinding()),
    GetPage(
        name: categoryDetail,
        page: () => CategoryDetailPage(),
        binding: CategoryDetailBinding()),
    GetPage(name: product, page: () => ProductsPage()),
    GetPage(name: transaction, page: () => TransactionsPage()),
    GetPage(name: profile, page: () => ProfilePage()),
    GetPage(name: productDetail, page: () => ProductDetailPage()),
  ];
}
