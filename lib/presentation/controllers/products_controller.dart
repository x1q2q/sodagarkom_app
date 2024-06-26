import 'package:get/get.dart';
import '../../domain/repositories/product_repository.dart';
import '../../domain/models/category.dart';
import '../../domain/models/product.dart';

class ProductsController extends GetxController {
  final ProductRepository _productRepository;
  ProductsController(this._productRepository);

  // var products = <Product>[].obs;
  List<Product> products = [];
  bool isGridView = true;
  bool isLoading = true;

  void changeTypeView() {
    isLoading = true;
    isGridView = !isGridView;
    fetchProducts();
    update();
  }

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    try {
      List<Product> fetchedProducts = await _productRepository.getProducts();
      isLoading = false;
      products = fetchedProducts;
    } catch (e) {
      print('failed to fetch producst: $e');
    }
    update();
  }
}
