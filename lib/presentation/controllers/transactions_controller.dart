import 'package:get/get.dart';
import '../../domain/repositories/transaction_repository.dart';
import '../../domain/models/transaction.dart';

class TransactionsController extends GetxController {
  final TransactionRepository _transactionRepository;

  TransactionsController(this._transactionRepository);
  var transactions =
      Transaction(id: 0, status: 'selesai', createdAt: '2024-10-05').obs;

  var idChipSelected = 0.obs;
  var chips = ['Semua', 'Selesai', 'Pending', 'Dibatalkan', 'Perlu Upload'];

  @override
  void onInit() {
    super.onInit();
  }

  void changeChip(bool selected, int index) {
    idChipSelected.value = selected ? index : 0;
  }

  void fetchTransactions() async {}
}
