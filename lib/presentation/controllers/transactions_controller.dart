import 'package:get/get.dart';
import '../../domain/repositories/transaction_repository.dart';
import '../../domain/models/transaction.dart';

class TransactionsController extends GetxController {
  final TransactionRepository _transactionRepository;

  TransactionsController(this._transactionRepository);

  var idChipSelected = 'all'.obs;
  List chips = [];
  bool isLoading = true;
  List<Transaction>? transactions;

  @override
  void onInit() {
    super.onInit();
    fetchFilters();
  }

  void changeChip(bool selected, String filter) {
    idChipSelected.value = selected ? filter : 'all';
    isLoading = true;
    fetchTransactionsFilter(filter);
  }

  void fetchFilters() async {
    try {
      List fetchedTransactions = await _transactionRepository.getFilters();
      chips = fetchedTransactions;
      idChipSelected.value = chips[0].id;
      fetchTransactionsFilter(chips[0].id);
    } catch (e) {
      print('failed to fetch filters: $e');
    }
    update();
  }

  void fetchTransactionsFilter(String filter) async {
    try {
      int dummCustomerId = 9;
      List<Transaction> fetchedTransactions = await _transactionRepository
          .getTransactionsFilter(dummCustomerId, filter);
      transactions = fetchedTransactions;
      isLoading = false;
    } catch (e) {
      print('failed to fetch transactions: $e');
    }
    update();
  }
}
