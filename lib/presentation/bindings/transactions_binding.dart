import 'package:get/get.dart';
import '../controllers/transactions_controller.dart';
import '../../data/network.dart';
import '../../domain/repositories/transaction_repository.dart';
import '../../core/core.dart';

class TransactionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NetworkService>(() => NetworkService(Core.pathApi));
    Get.lazyPut<TransactionRepository>(
        () => TransactionRepository(Get.find<NetworkService>()));
    Get.lazyPut<TransactionsController>(
        () => TransactionsController(Get.find<TransactionRepository>()));
  }
}
