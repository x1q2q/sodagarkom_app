import '../../data/network.dart';
import '../models/category.dart';

class CategoryRepository {
  final NetworkService _networkService;

  CategoryRepository(this._networkService);

  Future<Category> getCategoryByID() async {
    final response = await _networkService.fetchData('category/8');
    if (response.statusCode == 200) {
      final Map datas = Map.from(response.data);
      return Category.fromMap(datas['data'][0]);
    } else {
      throw Exception('Failed to load category data');
    }
  }
}
