import 'package:get/get.dart';
import '../../domain/repositories/category_repository.dart';
import '../../domain/models/category.dart';

class HomeController extends GetxController {
  final CategoryRepository _categoryRepository;

  HomeController(this._categoryRepository);

  var idChipSelected = 0.obs;
  List chips = [];
  Category? category;
  bool isLoading = true;

  @override
  void onInit() {
    super.onInit();
    handleRefresh();
  }

  void changeChip(bool selected, int index) {
    idChipSelected.value = selected ? index : 0;
    isLoading = true;
    fetchCategoryId(index.toString());
  }

  Future<void> handleRefresh() async {
    fetchCategories();
  }

  void fetchCategories() async {
    isLoading = true;
    try {
      List<Category> fetchedCategories =
          await _categoryRepository.getCategories();
      chips = fetchedCategories;
      idChipSelected.value = chips[0].id;
      fetchCategoryId(chips[0].id.toString());
    } catch (e) {
      print('failed to fetch categories: $e');
    }
    update();
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
}
