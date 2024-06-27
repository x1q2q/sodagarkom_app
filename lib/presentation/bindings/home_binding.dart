import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../controllers/carts_controller.dart';
import '../../data/network.dart';
import '../../domain/repositories/category_repository.dart';
import '../../domain/repositories/cart_repository.dart';
import '../../core/core.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NetworkService>(() => NetworkService(Core.pathApi));
    Get.lazyPut<CategoryRepository>(
        () => CategoryRepository(Get.find<NetworkService>()));
    Get.lazyPut<HomeController>(
        () => HomeController(Get.find<CategoryRepository>()));

    Get.lazyPut<CartRepository>(
        () => CartRepository(Get.find<NetworkService>()));
    Get.lazyPut<CartsController>(
        () => CartsController(Get.find<CartRepository>()));
  }
}
