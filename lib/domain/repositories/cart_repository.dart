import '../../data/network.dart';
import '../models/cart.dart';

class CartRepository {
  final NetworkService _networkService;

  CartRepository(this._networkService);

  Future<Cart> getCartByID() async {
    final response = await _networkService.fetchData('user/8');
    if (response.statusCode == 200) {
      final Map datas = Map.from(response.data);
      return Cart.fromMap(datas['data'][0]);
    } else {
      throw Exception('Failed to load Cart data');
    }
  }
}
