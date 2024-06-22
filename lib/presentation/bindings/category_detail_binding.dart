import 'package:get/get.dart';
import '../controllers/category_detail_controller.dart';
import '../../data/network.dart';
import '../../domain/repositories/category_detail_repository.dart';
import '../../core/core.dart';

class CategoryDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NetworkService>(() => NetworkService(Core.appBaseURL));
    Get.lazyPut<CategoryDetailRepository>(
        () => CategoryDetailRepository(Get.find<NetworkService>()));
    Get.lazyPut<CategoryDetailController>(
        () => CategoryDetailController(Get.find<CategoryDetailRepository>()));
  }
}
