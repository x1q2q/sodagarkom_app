import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../domain/repositories/product_repository.dart';
import '../../domain/models/product.dart';
import '../services/storage_service.dart';
import '../services/toast_service.dart';

class MySearchController extends GetxController {
  final ProductRepository _productRepository;
  MySearchController(this._productRepository);
  final TextEditingController txtController = TextEditingController();
  var isLoading = true.obs;
  var onSubmit = false.obs;
  var isGridView = true;
  List<Map<String, dynamic>>? searchHistory;
  List<Product> products = [];

  void changeTypeView() {
    isGridView = !isGridView;
    update();
  }

  void searchKeywords(String value) async {
    if (value.trim().isEmpty) {
      ToastService.rawToast('keyword masih kosong');
    } else {
      onSubmit.value = true;
      StorageService().saveData(value);
      fetchProducts(value);
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchHistory();
  }

  void fetchHistory() async {
    searchHistory = await StorageService().getData();
    isLoading.value = false;
  }

  void removeHistory(String id) async {
    StorageService().deleteData(id);
    searchHistory!.removeWhere((item) => item['id'] == id);
    update();
  }

  void fillSearchField(String id) async {
    int index = searchHistory!.indexWhere((item) => item['id'] == id);
    txtController.text = searchHistory![index]['value'];
    update();
  }

  void fetchProducts(String keyword) async {
    try {
      List<Product> fetchedProducts =
          await _productRepository.searchProducts(keyword);
      products = fetchedProducts;
      isLoading.value = false;
    } catch (e) {
      print('failed to search product: $e');
    }
    update();
  }
}
