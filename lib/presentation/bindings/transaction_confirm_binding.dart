import 'package:get/get.dart';
import '../controllers/transaction_confirm_controller.dart';
import '../../data/network.dart';
import '../../domain/repositories/transaction_repository.dart';
import '../../core/core.dart';

class TransactionConfirmBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NetworkService>(() => NetworkService(Core.pathApi));
    Get.lazyPut<TransactionRepository>(
        () => TransactionRepository(Get.find<NetworkService>()));
    Get.lazyPut<TransactionConfirmController>(
        () => TransactionConfirmController(Get.find<TransactionRepository>()));
  }
}
