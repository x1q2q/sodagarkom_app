import '../../data/network.dart';
import '../models/cart.dart';

class CartRepository {
  final NetworkService _networkService;

  CartRepository(this._networkService);

  Future<List<Cart>> getCarts(String customerId) async {
    final response = await _networkService.fetchData('carts/$customerId');
    if (response.statusCode == 200) {
      final Map result = Map.from(response.data);
      final List<dynamic> jsonResults = result['data'];

      List<Cart> carts = List.generate(jsonResults.length, (j) {
        return Cart.fromJson(jsonResults[j]);
      });
      return carts;
    } else {
      throw Exception('Failed to load carts data');
    }
  }
}
