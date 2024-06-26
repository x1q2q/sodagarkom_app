import 'package:get/get.dart';
import '../controllers/products_controller.dart';
import '../controllers/carts_controller.dart';
import '../../data/network.dart';
import '../../domain/repositories/product_repository.dart';
import '../../domain/repositories/cart_repository.dart';
import '../../core/core.dart';

class ProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NetworkService>(() => NetworkService(Core.pathApi));
    Get.lazyPut<ProductRepository>(
        () => ProductRepository(Get.find<NetworkService>()));
    Get.lazyPut<ProductsController>(
        () => ProductsController(Get.find<ProductRepository>()));

    Get.lazyPut<CartRepository>(
        () => CartRepository(Get.find<NetworkService>()));
    Get.lazyPut<CartsController>(
        () => CartsController(Get.find<CartRepository>()));
  }
}
