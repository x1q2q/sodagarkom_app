import '../../data/network.dart';
import '../models/transaction.dart';
import '../models/filter.dart';

class TransactionRepository {
  final NetworkService _networkService;

  TransactionRepository(this._networkService);

  Future<List<Filter>> getFilters() async {
    final response = await _networkService.fetchData('transaction/filters');
    if (response.statusCode == 200) {
      final Map result = Map.from(response.data);
      final List<dynamic> jsonResults = result['data'];
      List<Filter> filters = List.generate(jsonResults.length, (j) {
        return Filter.fromJson(jsonResults[j]);
      });
      return filters;
    } else {
      throw Exception('Failed to load filters data');
    }
  }

  Future<List<Transaction>> getTransactionsFilter(
      int customerId, String filter) async {
    final response =
        await _networkService.fetchData('transactions/$customerId/$filter');
    if (response.statusCode == 200) {
      final Map result = Map.from(response.data);
      final List<dynamic> jsonResults = result['data'];

      List<Transaction> transactions = List.generate(jsonResults.length, (j) {
        return Transaction.fromJson(jsonResults[j]);
      });
      return transactions;
    } else {
      throw Exception('Failed to load transactions data');
    }
  }

  Future<Transaction> getTransactionByID(
      int customerId, String transactionId) async {
    final response = await _networkService
        .fetchData('transaction/$customerId/all/$transactionId');
    if (response.statusCode == 200) {
      final Map datas = Map.from(response.data);
      return Transaction.fromJson(datas['data'][0]);
    } else {
      throw Exception('Failed to load Transactions data');
    }
  }
}
