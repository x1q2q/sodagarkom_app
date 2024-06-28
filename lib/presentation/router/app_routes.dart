import 'package:get/get.dart';
import '../widgets/app_tab.dart';
import '../bindings/bindings.dart';
import '../pages/pages.dart';

class AppRoutes {
  static const String appTab = '/app-tab';
  static const String home = '/home';
  static const String product = '/products';
  static const String transaction = '/transactions';
  static const String profile = '/profile';
  static const String categoryDetail = '/category-detail/:id';
  static const String productDetail = '/product-detail/:id';
  static const String editProfile = '/edit-profile';
  static const String transactionDetail = '/transaction-detail/:id';
  static const String carts = '/carts';
  static const String transactionConfirm = '/transaction-confirm';
  static const String search = '/search';
  static const String login = '/login';
  static const String registration = '/registration';

  static final routes = [
    GetPage(name: appTab, page: () => AppTab(), binding: TabsBinding()),
    GetPage(name: home, page: () => HomePage(), binding: HomeBinding()),
    GetPage(
        name: categoryDetail,
        page: () => CategoryDetailPage(),
        binding: CategoryDetailBinding()),
    GetPage(
        name: product, page: () => ProductsPage(), binding: ProductsBinding()),
    GetPage(
        name: transaction,
        page: () => TransactionsPage(),
        binding: TransactionsBinding()),
    GetPage(
        name: profile, page: () => ProfilePage(), binding: ProfileBinding()),
    GetPage(
        name: editProfile,
        page: () => EditProfilePage(),
        binding: ProfileBinding()),
    GetPage(
        name: transactionDetail,
        page: () => TransactionDetailPage(),
        binding: TransactionDetailBinding()),
    GetPage(
        name: productDetail,
        page: () => ProductDetailPage(),
        binding: ProductDetailBinding()),
    GetPage(name: carts, page: () => CartsPage(), binding: CartsBinding()),
    GetPage(
        name: transactionConfirm,
        page: () => TransactionConfirmPage(),
        binding: TransactionConfirmBinding()),
    GetPage(name: search, page: () => SearchPage(), binding: SearchBinding()),
    GetPage(name: login, page: () => LoginPage()),
    GetPage(name: registration, page: () => RegistrationPage()),
  ];
}
