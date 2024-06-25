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
          description: ''' Highlights :
• Full HD, IPS panel , up to 91% screen body ratio.
• Fleksibilitas upgrade (max: 2TB HDD max , 1TB SSD, memory 64GB)
• Menjaga kenyamanan mata Anda dalam bekerja atau belajar dengan feature Acer Bluelightshield™ & Flickerless™.
• Peningkatan performa hingga 43% dengan Intel Processor 12th gen.

Aspire All in One C22-1700
• Processor : 12th Gen Intel® CoreTM i5-1235U (12Mb Cache, up to 4.40Ghz) processor
• OS : Windows 11 Home
• Memory : 8 GB DDR4 2666 MHz soDIMM, Up to 64 GB of Dual-channel DDR4 3200 MHz
• Storage : 512 GB M.2 2280 PCI-E SSD
• Inch, Res, Ratio, Panel :
• Graphics : Intel® Iris® Xe Graphics ''')
      .obs;
}
