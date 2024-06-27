import 'package:get/get.dart';
import '../../domain/repositories/category_repository.dart';
import '../../domain/models/category.dart';

class HomeController extends GetxController {
  final CategoryRepository _categoryRepository;

  HomeController(this._categoryRepository);
  var idChipSelected = 0.obs;
  List<Category> categories = [];
  Category? category;
  bool isLoading = true;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  void changeChip(bool selected, int index) {
    idChipSelected.value = selected ? index : 0;
  }

  void fetchCategories() async {
    try {
      List<Category> fetchedCategories =
          await _categoryRepository.getCategories();
      categories = fetchedCategories;
      idChipSelected.value = categories[0].id;
      fetchCategoryId(categories[0].id.toString());
    } catch (e) {
      print('failed to fetch categories: $e');
    }
    update();
  }

  void fetchCategoryId(String id) async {
    isLoading = true;
    try {
      Category fetchedCategory = await _categoryRepository.getCategoryByID(id);
      category = fetchedCategory;
      isLoading = false;
      // print(category!.products!.length);
    } catch (e) {
      print('failed to fetch category id: $e');
    }
    update();
  }
}
