import 'package:get/get.dart';
import '../pages/home_page.dart';
import '../bindings/home_binding.dart';

class AppRoutes {
  static const String home = '/home';
  static final routes = [
    GetPage(name: home, page: () => HomePage(), binding: HomeBinding())
  ];
}
