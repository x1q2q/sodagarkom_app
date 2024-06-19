import '../../data/network.dart';
import '../models/product.dart';

class ProductRepository {
  final NetworkService networkService;

  ProductRepository(this.networkService);

  Future<Product> getProductByID() async {
    final response = await networkService.fetchData('product/1');
    if (response.statusCode == 200) {
      final data = response.data;
      return Product.fromMap(data);
    } else {
      throw Exception('Failed to load user data');
    }
  }
}
