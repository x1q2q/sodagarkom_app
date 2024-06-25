import 'package:get/get.dart';
import '../../domain/repositories/product_repository.dart';
import '../../domain/models/product.dart';

class MySearchController extends GetxController {
  final ProductRepository _productRepository;

  MySearchController(this._productRepository);
  var product = Product(
          id: 0,
          name: 'loading...',
          categoryName: 'loading...',
          stock: 0,
          price: 0,
          description: 'loading...')
      .obs;

  var onSubmit = false.obs;
  var isGridView = true.obs;

  void changeTypeView() {
    isGridView.value = !isGridView.value;
  }

  void searchKeywords(String value) {
    print(value);
    onSubmit.value = true;
  }

  @override
  void onInit() {
    super.onInit();
    // fetchProduct();
  }
}
