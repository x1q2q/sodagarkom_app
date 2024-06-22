import 'package:get/get.dart';
import '../../domain/repositories/category_detail_repository.dart';
import '../../domain/models/category.dart';
import '../../domain/models/product.dart';

class CategoryDetailController extends GetxController {
  final CategoryDetailRepository _categoryDetailRepository;

  CategoryDetailController(this._categoryDetailRepository);

  var dumpCategory = Category(
          id: 1,
          name: 'Laptop Asus',
          description:
              'Some descriptions desriptions some descriptions desriptions some descriptions desriptions ')
      .obs;
  var products = [
    Product(
        id: 0,
        name: 'Laptop Asus Aspire1',
        categoryName: 'Laptop Asus',
        stock: 10,
        price: 25000000,
        description: 'still in description'),
    Product(
        id: 1,
        name: 'Laptop Asus Aspire1',
        categoryName: 'Laptop Asus',
        stock: 10,
        price: 25000000,
        description: 'still in description')
  ].obs;
  @override
  void onInit() {
    super.onInit();
    // fetchCategory();
  }

  void fetchCategory() async {
    // try {
    //   Category fetchedCategory = await _categoryDetailRepository.getCategoryByID();
    //   category.value = fetchedCategory;
    // } catch (e) {
    //   print('failed to fetch producst: $e');
    // }
  }
}
