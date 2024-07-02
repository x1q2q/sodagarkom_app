import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../domain/repositories/transaction_repository.dart';
import '../../domain/models/transaction.dart';

class TransactionDetailController extends GetxController {
  final TransactionRepository _transactionRepository;

  TransactionDetailController(this._transactionRepository);

  var isVisiblePaymentProof = false.obs;
  bool isLoading = true;
  Transaction? transaction;
  int? totalQtyBarang;
  final box = GetStorage();
  int? customerId;

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
    customerId = box.read('customerId');
    try {
      Transaction fetchedTransaction = await _transactionRepository
          .getTransactionByID(customerId!, transactionId);
      transaction = fetchedTransaction;
      totalQtyBarang = fetchedTransaction.products!
          .map((product) => product.productQuantity)
          .reduce((a, b) => a + b);
      isLoading = false;
    } catch (e) {
      print('failed to fetch transaction detail: $e');
    }
    update();
  }
}
