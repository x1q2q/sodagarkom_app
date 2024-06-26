import 'package:get/get.dart';
import '../controllers/product_detail_controller.dart';
import '../../data/network.dart';
import '../../domain/repositories/product_repository.dart';
import '../../core/core.dart';

class ProductDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NetworkService>(() => NetworkService(Core.pathApi));
    Get.lazyPut<ProductRepository>(
        () => ProductRepository(Get.find<NetworkService>()));
    Get.lazyPut<ProductDetailController>(
        () => ProductDetailController(Get.find<ProductRepository>()));
  }
}
