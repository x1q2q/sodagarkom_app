import '../../data/network.dart';
import '../models/category.dart';

class CategoryRepository {
  final NetworkService _networkService;

  CategoryRepository(this._networkService);

  Future<List<Category>> getCategories() async {
    final response = await _networkService.fetchData('categories');
    if (response.statusCode == 200) {
      final Map result = Map.from(response.data);
      final List<dynamic> jsonResults = result['data'];

      List<Category> categories = List.generate(jsonResults.length, (j) {
        return Category(
            id: int.parse(jsonResults[j]['id']),
            name: jsonResults[j]['name'],
            description: jsonResults[j]['description'],
            imageThumb: jsonResults[j]['image_thumb']);
      });
      return categories;
    } else {
      throw Exception('Failed to load category data');
    }
  }

  Future<Category> getCategoryByID(String id) async {
    final response = await _networkService.fetchData('category/$id');
    if (response.statusCode == 200) {
      final Map result = Map.from(response.data);
      return Category.fromJson(result['data'][0]);
    } else {
      throw Exception('Failed to load category data');
    }
  }
}
