import 'package:get/get.dart';
import '../../domain/repositories/product_repository.dart';
import '../../domain/models/product.dart';

class ProductDetailController extends GetxController {
  final ProductRepository _productRepository;
  ProductDetailController(this._productRepository);

  Product? product;
  var isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
    String productId = Get.parameters['id'] ?? 'unknown';
    fetchProductId(productId);
  }

  void fetchProductId(String id) async {
    try {
      Product fetchedProduct = await _productRepository.getProductByID(id);
      isLoading.value = false;
      product = fetchedProduct;
    } catch (e) {
      print('failed to fetch product id: $e');
    }
    update();
  }
}
