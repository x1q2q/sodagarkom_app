import 'package:get/get.dart';
import '../../domain/repositories/product_repository.dart';
import '../../domain/models/product.dart';

class ProductDetailController extends GetxController {
  final ProductRepository _productRepository;
  ProductDetailController(this._productRepository);

  Product? product;
  bool isLoading = true;
  String? productId;
  @override
  void onInit() {
    super.onInit();
    productId = Get.parameters['id'] ?? 'unknown';
    fetchProductId(productId!);
  }

  void fetchProductId(String id) async {
    try {
      Product fetchedProduct = await _productRepository.getProductByID(id);
      isLoading = false;
      product = fetchedProduct;
    } catch (e) {
      print('failed to fetch product id: $e');
    }
    update();
  }
}
