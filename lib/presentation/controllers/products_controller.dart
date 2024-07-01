import 'package:get/get.dart';
import '../../domain/repositories/product_repository.dart';
import '../../domain/models/product.dart';

class ProductsController extends GetxController {
  final ProductRepository _productRepository;
  ProductsController(this._productRepository);

  List<Product> products = [];
  bool isGridView = true;
  bool isLoading = true;

  @override
  void onInit() {
    super.onInit();
    handleRefresh();
  }

  Future<void> handleRefresh() async {
    isLoading = true;
    update();
    fetchProducts();
  }

  void changeTypeView() {
    isLoading = true;
    isGridView = !isGridView;
    fetchProducts();
    update();
  }

  void fetchProducts() async {
    try {
      List<Product> fetchedProducts = await _productRepository.getProducts();
      products = fetchedProducts;
      isLoading = false;
    } catch (e) {
      print('failed to fetch producst: $e');
    }
    update();
  }

  void addToCart(String id) async {
    print(id);
  }
}
