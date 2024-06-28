import 'package:get/get.dart';
import '../../domain/repositories/category_repository.dart';
import '../../domain/models/category.dart';

class CategoryDetailController extends GetxController {
  final CategoryRepository _categoryRepository;

  CategoryDetailController(this._categoryRepository);

  var isGridView = false;
  bool isLoading = true;
  Category? category;

  void changeTypeView() {
    isGridView = !isGridView;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    String categoryId = Get.parameters['id'] ?? 'unknown';
    fetchCategoryId(categoryId);
  }

  void fetchCategoryId(String id) async {
    try {
      Category fetchedCategory = await _categoryRepository.getCategoryByID(id);
      category = fetchedCategory;
      isLoading = false;
    } catch (e) {
      print('failed to fetch category id: $e');
    }
    update();
  }

  void addToCart(String id) async {
    print(id);
  }
}
