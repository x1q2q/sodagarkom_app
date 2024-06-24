import 'package:get/get.dart';
import '../controllers/users_controller.dart';
import '../../data/network.dart';
import '../../domain/repositories/user_repository.dart';
import '../../core/core.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NetworkService>(() => NetworkService(Core.appBaseURL));
    Get.lazyPut<UserRepository>(
        () => UserRepository(Get.find<NetworkService>()));
    Get.lazyPut<UsersController>(
        () => UsersController(Get.find<UserRepository>()));
  }
}
