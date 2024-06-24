import 'package:get/get.dart';
import '../../domain/repositories/transaction_repository.dart';
import '../../domain/models/transaction.dart';

class TransactionDetailController extends GetxController {
  final TransactionRepository _transactionRepository;

  TransactionDetailController(this._transactionRepository);
  var transactions =
      Transaction(id: 0, status: 'selesai', createdAt: '2024-10-05').obs;

  var isVisiblePaymentProof = false.obs;

  void changeVisionPayProof() {
    isVisiblePaymentProof.value = !isVisiblePaymentProof.value;
  }

  @override
  void onInit() {
    super.onInit();
  }

  void fetchTransactions() async {}
}
