import '../../data/network.dart';
import '../models/product.dart';

class ProductRepository {
  final NetworkService _networkService;

  ProductRepository(this._networkService);

  Future<Product> getProductByID() async {
    final response = await _networkService.fetchData('product/8');
    if (response.statusCode == 200) {
      final Map datas = Map.from(response.data);
      return Product.fromMap(datas['data'][0]);
    } else {
      throw Exception('Failed to load products data');
    }
  }
}
