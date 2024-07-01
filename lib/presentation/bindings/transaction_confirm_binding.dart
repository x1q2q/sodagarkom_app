import 'package:get/get.dart';
import '../controllers/transaction_confirm_controller.dart';
import '../../data/network.dart';
import '../../domain/repositories/transaction_repository.dart';
import '../../domain/repositories/cart_repository.dart';
import '../controllers/carts_controller.dart';
import '../../core/core.dart';

class TransactionConfirmBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NetworkService>(() => NetworkService(Core.pathApi));
    Get.lazyPut<TransactionRepository>(
        () => TransactionRepository(Get.find<NetworkService>()));
    Get.lazyPut<TransactionConfirmController>(
        () => TransactionConfirmController(Get.find<TransactionRepository>()));

    Get.lazyPut<CartRepository>(
        () => CartRepository(Get.find<NetworkService>()));
    Get.lazyPut<CartsController>(
        () => CartsController(Get.find<CartRepository>()));
  }
}
