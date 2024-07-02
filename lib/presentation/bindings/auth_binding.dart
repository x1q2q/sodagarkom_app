import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../../data/network.dart';
import '../../domain/repositories/customer_repository.dart';
import '../../core/core.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NetworkService>(() => NetworkService(Core.pathApi));
    Get.lazyPut<CustomerRepository>(
        () => CustomerRepository(Get.find<NetworkService>()));
    Get.lazyPut<AuthController>(
        () => AuthController(Get.find<CustomerRepository>()));
  }
}
