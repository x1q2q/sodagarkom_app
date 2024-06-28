import 'package:get/get.dart';
import '../../domain/repositories/transaction_repository.dart';
import '../../domain/models/transaction.dart';

class TransactionDetailController extends GetxController {
  final TransactionRepository _transactionRepository;

  TransactionDetailController(this._transactionRepository);

  var isVisiblePaymentProof = false.obs;
  bool isLoading = true;
  Transaction? transaction;

  void changeVisionPayProof() {
    isVisiblePaymentProof.value = !isVisiblePaymentProof.value;
  }

  @override
  void onInit() {
    super.onInit();
    String transactionId = Get.parameters['id'] ?? 'unknown';
    fetchTransactionId(transactionId);
  }

  void fetchTransactionId(String transactionId) async {
    try {
      int dummCustomerId = 9;
      Transaction fetchedTransaction = await _transactionRepository
          .getTransactionByID(dummCustomerId, transactionId);
      transaction = fetchedTransaction;
      isLoading = false;
    } catch (e) {
      print('failed to fetch transaction detail: $e');
    }
    update();
  }
}
