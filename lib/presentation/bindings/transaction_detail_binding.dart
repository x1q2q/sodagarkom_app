import 'package:get/get.dart';
import '../controllers/transaction_detail_controller.dart';
import '../../data/network.dart';
import '../../domain/repositories/transaction_repository.dart';
import '../../core/core.dart';

class TransactionDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NetworkService>(() => NetworkService(Core.pathApi));
    Get.lazyPut<TransactionRepository>(
        () => TransactionRepository(Get.find<NetworkService>()));
    Get.lazyPut<TransactionDetailController>(
        () => TransactionDetailController(Get.find<TransactionRepository>()));
  }
}
