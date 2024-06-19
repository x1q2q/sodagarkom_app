import 'package:get/get.dart';
import '../../domain/repos/product_repository.dart';
import '../../domain/models/product.dart';

class HomeController extends GetxController {
  ProductRepository? productRepository;
  var product = Product(
          id: 0,
          name: 'loading...',
          categoryName: 'loading...',
          stock: 0,
          price: 0,
          description: 'loading...')
      .obs;
  // var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    try {
      Product fetchedProduct = await productRepository!.getProductByID();
      product.value = fetchedProduct;
    } catch (e) {
      print('failed to fetch producst: $e');
    }
  }
}
