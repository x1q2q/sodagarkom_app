import 'package:get/get.dart';
import '../../domain/repositories/product_repository.dart';
import '../../domain/models/product.dart';

class HomeController extends GetxController {
  final ProductRepository _productRepository;

  HomeController(this._productRepository);
  var product = Product(
          id: 0,
          name: 'loading...',
          categoryName: 'loading...',
          stock: 0,
          price: 0,
          description: 'loading...',
          imageThumb: 'loading')
      .obs;
  var idChipSelected = 0.obs;
  var chips = ['Laptop Asus', 'Macbook', 'Laptop Acer', 'Monitor'];

  @override
  void onInit() {
    super.onInit();
  }

  void changeChip(bool selected, int index) {
    idChipSelected.value = selected ? index : 0;
  }
}
