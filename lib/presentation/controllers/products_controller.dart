import 'package:get/get.dart';
import '../../domain/repositories/product_repository.dart';
import '../../domain/models/category.dart';
import '../../domain/models/product.dart';

class ProductsController extends GetxController {
  final ProductRepository _productRepository;
  ProductsController(this._productRepository);

  @override
  void onInit() {
    super.onInit();
    // fetchProducts();
  }

  var isGridView = true.obs;

  void changeTypeView() {
    isGridView.value = !isGridView.value;
  }

  var product = Product(
          id: 0,
          name: 'loading...',
          categoryName: 'loading...',
          stock: 0,
          price: 0,
          description: 'loading...')
      .obs;
}
