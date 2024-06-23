import 'package:get/get.dart';
import '../controllers/category_detail_controller.dart';
import '../../data/network.dart';
import '../../domain/repositories/category_repository.dart';
import '../../core/core.dart';

class CategoryDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NetworkService>(() => NetworkService(Core.appBaseURL));
    Get.lazyPut<CategoryRepository>(
        () => CategoryRepository(Get.find<NetworkService>()));
    Get.lazyPut<CategoryDetailController>(
        () => CategoryDetailController(Get.find<CategoryRepository>()));
  }
}
