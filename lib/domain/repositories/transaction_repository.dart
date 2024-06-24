import '../../data/network.dart';
import '../models/transaction.dart';

class TransactionRepository {
  final NetworkService _networkService;

  TransactionRepository(this._networkService);

  Future<Transaction> getTransactionByID() async {
    final response = await _networkService.fetchData('transaction/8');
    if (response.statusCode == 200) {
      final Map datas = Map.from(response.data);
      return Transaction.fromMap(datas['data'][0]);
    } else {
      throw Exception('Failed to load Transactions data');
    }
  }
}
