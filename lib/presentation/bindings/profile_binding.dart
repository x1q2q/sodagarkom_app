import 'package:get/get.dart';
import '../controllers/profile_controller.dart';
import '../../data/network.dart';
import '../../domain/repositories/customer_repository.dart';
import '../../core/core.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NetworkService>(() => NetworkService(Core.pathApi));
    Get.lazyPut<CustomerRepository>(
        () => CustomerRepository(Get.find<NetworkService>()));
    Get.lazyPut<ProfileController>(
        () => ProfileController(Get.find<CustomerRepository>()));
  }
}
