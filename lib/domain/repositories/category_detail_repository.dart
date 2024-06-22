import '../../data/network.dart';
import '../models/category.dart';

class CategoryDetailRepository {
  final NetworkService _networkService;

  CategoryDetailRepository(this._networkService);

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
