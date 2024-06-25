import 'package:get/get.dart';
import '../controllers/carts_controller.dart';
import '../../data/network.dart';
import '../../domain/repositories/cart_repository.dart';
import '../../core/core.dart';

class CartsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NetworkService>(() => NetworkService(Core.appBaseURL));
    Get.lazyPut<CartRepository>(
        () => CartRepository(Get.find<NetworkService>()));
    Get.lazyPut<CartsController>(
        () => CartsController(Get.find<CartRepository>()));
  }
}
