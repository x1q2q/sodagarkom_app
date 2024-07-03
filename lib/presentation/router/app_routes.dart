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
    GetPage(name: appTab, page: () => const AppTab(), binding: TabsBinding()),
    GetPage(name: home, page: () => const HomePage(), binding: HomeBinding()),
    GetPage(
        name: categoryDetail,
        page: () => const CategoryDetailPage(),
        binding: CategoryDetailBinding()),
    GetPage(
        name: product,
        page: () => const ProductsPage(),
        binding: ProductsBinding()),
    GetPage(
        name: transaction,
        page: () => const TransactionsPage(),
        binding: TransactionsBinding()),
    GetPage(
        name: profile,
        page: () => const ProfilePage(),
        binding: ProfileBinding()),
    GetPage(
        name: editProfile,
        page: () => const EditProfilePage(),
        binding: ProfileBinding()),
    GetPage(
        name: transactionDetail,
        page: () => const TransactionDetailPage(),
        binding: TransactionDetailBinding()),
    GetPage(
        name: productDetail,
        page: () => const ProductDetailPage(),
        binding: ProductDetailBinding()),
    GetPage(
        name: carts, page: () => const CartsPage(), binding: CartsBinding()),
    GetPage(
        name: transactionConfirm,
        page: () => const TransactionConfirmPage(),
        binding: TransactionConfirmBinding()),
    GetPage(name: search, page: () => SearchPage(), binding: SearchBinding()),
    GetPage(name: login, page: () => LoginPage(), binding: AuthBinding()),
    GetPage(
        name: registration,
        page: () => RegistrationPage(),
        binding: AuthBinding())
  ];
}
