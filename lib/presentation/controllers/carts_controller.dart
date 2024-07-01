import 'package:get/get.dart';
import '../../domain/repositories/cart_repository.dart';
import '../../domain/models/cart.dart';
import '../router/app_routes.dart';
import '../../core/colors.dart';
import '../services/dialog_services.dart';

class CartsController extends GetxController {
  final CartRepository _cartRepository;

  CartsController(this._cartRepository);
  var carts = <Cart>[].obs;
  bool isLoading = true;
  bool isLoadingProcess = false;
  var qtyCarts = 0.obs;
  String dummCustomerId = '9';

  @override
  void onInit() {
    super.onInit();
    handleRefresh();
  }

  Future<void> handleRefresh() async {
    isLoading = true;
    update();
    fetchCarts();
  }

  void goToCarts() {
    Get.toNamed(AppRoutes.carts);
  }

  void incrementItemCart(int cartId) {
    int index = carts.indexWhere((item) => item.id == cartId);
    int value = carts[index].quantity.value + 1;
    updateItemCart(cartId, value);
  }

  void decrementItemCart(int cartId) {
    int index = carts.indexWhere((item) => item.id == cartId);
    if (carts[index].quantity.value > 1) {
      int value = carts[index].quantity.value - 1;
      updateItemCart(cartId, value);
    } else {
      removeItemCart(cartId);
    }
  }

  void removeItemCart(int cartId) async {
    carts.removeWhere((item) => item.id == cartId);
    qtyCarts.value = carts.length;
    update();
  }

  void updateItemCart(int cartId, int value) async {
    int index = carts.indexWhere((item) => item.id == cartId);
    if (onHitMaxValue(value, cartId)) {
      toast('maximal stok adalah ${carts[index].stock} item');
    } else if (onHitMinuseValue(value)) {
      toast('stok tidak boleh bernilai minus');
    } else if (value == 0) {
      removeItemCart(cartId);
    } else {
      carts[index].quantity.value = value;
      update();
    }
  }

  bool onHitMaxValue(int assignedValue, int cartId) {
    int index = carts.indexWhere((item) => item.id == cartId);
    return assignedValue > carts[index].stock;
  }

  bool onHitMinuseValue(int assignedValue) {
    return assignedValue < 0;
  }

  void toast(String message) {
    Get.rawSnackbar(
        message: message,
        maxWidth: Get.width,
        backgroundColor: AppColors.redv2,
        snackPosition: SnackPosition.TOP);
  }

  void fetchCarts() async {
    try {
      List<Cart> fetchedCarts = await _cartRepository.getCarts(dummCustomerId);
      isLoading = false;
      carts.assignAll(fetchedCarts);
      qtyCarts.value = fetchedCarts.length;
    } catch (e) {
      isLoading = false;
      carts.clear();
      qtyCarts.value = 0;
      print('failed to fetch carts: $e');
    }
    update();
  }

  void goTransactionConfirm() {
    if (carts.value.isNotEmpty) {
      Get.toNamed(AppRoutes.transactionConfirm);
    } else {
      toast('tidak ada data dalam keranjang, silahkan belanja terlebih dahulu');
    }
  }

  void addToCart(int productId) async {
    try {
      isLoading = true;
      Map<String, dynamic> data = {
        'customer_id': dummCustomerId,
        'product_id': productId
      };
      Map<String, dynamic> result = await _cartRepository.insertCart(data);
      isLoadingProcess = false;

      DialogService.showToast('success', result['message']);
      Get.toNamed(AppRoutes.carts);
      Cart cartResult = Cart.fromJson(result['data'][0]);

      carts.insert(0, cartResult);
      isLoading = false;
    } catch (e) {
      print('failed add product to cart: $e');
      DialogService.showToast('error', '$e');
    }
    update();
  }
}
