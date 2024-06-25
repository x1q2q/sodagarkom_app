import 'package:get/get.dart';
import '../controllers/my_search_controller.dart';
import '../../data/network.dart';
import '../../domain/repositories/product_repository.dart';
import '../../core/core.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NetworkService>(() => NetworkService(Core.appBaseURL));
    Get.lazyPut<ProductRepository>(
        () => ProductRepository(Get.find<NetworkService>()));
    Get.lazyPut<MySearchController>(
        () => MySearchController(Get.find<ProductRepository>()));
  }
}
