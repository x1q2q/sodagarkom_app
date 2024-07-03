import '../../data/network.dart';
import '../models/product.dart';

class ProductRepository {
  final NetworkService _networkService;

  ProductRepository(this._networkService);

  Future<List<Product>> getProducts() async {
    final response = await _networkService.fetchData('products');
    if (response.statusCode == 200) {
      final Map result = Map.from(response.data);
      final List<dynamic> jsonResults = result['data'];

      List<Product> products = List.generate(jsonResults.length, (j) {
        return Product.fromJson(jsonResults[j]);
      });
      return products;
    } else {
      throw Exception('Failed to load products data');
    }
  }

  Future<Product> getProductByID(String id) async {
    final response = await _networkService.fetchData('product/$id');
    if (response.statusCode == 200) {
      final Map result = Map.from(response.data);
      return Product.fromJson(result['data'][0]);
    } else {
      throw Exception('Failed to load products data');
    }
  }

  Future<List<Product>> searchProducts(String keyword) async {
    Map<String, dynamic> data = {'keyword': keyword};
    final response = await _networkService.insertData('product/search', data);
    if (response.statusCode == 200) {
      final Map result = Map.from(response.data);
      final List<dynamic> jsonResults = result['data'];
      List<Product> products = List.generate(jsonResults.length, (j) {
        return Product.fromJson(jsonResults[j]);
      });

      return products;
    } else {
      throw Exception('Failed to search products data');
    }
  }
}
