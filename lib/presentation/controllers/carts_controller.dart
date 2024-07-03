import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../domain/repositories/cart_repository.dart';
import '../../domain/models/cart.dart';
import '../router/app_routes.dart';
import '../services/toast_service.dart';

class CartsController extends GetxController {
  final CartRepository _cartRepository;

  CartsController(this._cartRepository);
  final box = GetStorage();
  var carts = <Cart>[].obs;
  bool isLoading = true;
  bool isLoadingProcess = false;
  var qtyCarts = 0.obs;
  int? customerId;

  @override
  void onInit() {
    super.onInit();
    handleRefresh();
  }

  Future<void> handleRefresh() async {
    customerId = box.read('customerId');
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
      deleteCart(cartId);
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
      ToastService.topToast('red',
          'maximal stok ${carts[index].productName} adalah ${carts[index].stock} item');
    } else if (onHitMinuseValue(value)) {
      ToastService.topToast('yellow', 'stok tidak boleh bernilai minus');
    } else if (value == 0) {
      removeItemCart(cartId);
    } else if (value.runtimeType != int) {
      ToastService.topToast('yellow', 'berikan value berupa angka');
    } else {
      bool updated = await updateCart(value, cartId);
      if (updated) {
        int changes = value - carts[index].quantity.value;
        carts[index].quantity.value = value;

        qtyCarts.value += changes;
        update();
      }
    }
  }

  bool onHitMaxValue(int assignedValue, int cartId) {
    int index = carts.indexWhere((item) => item.id == cartId);
    return assignedValue > carts[index].stock;
  }

  bool onHitMinuseValue(int assignedValue) {
    return assignedValue < 0;
  }

  void fetchCarts() async {
    try {
      List<Cart> fetchedCarts = await _cartRepository.getCarts(customerId!);
      isLoading = false;
      carts.assignAll(fetchedCarts);
      qtyCarts.value = fetchedCarts
          .map((product) => product.quantity.value)
          .reduce((a, b) => a + b);
    } catch (e) {
      isLoading = false;
      carts.clear();
      qtyCarts.value = 0;
      print('failed to fetch carts: $e');
    }
    update();
  }

  void goTransactionConfirm() {
    Get.toNamed(AppRoutes.transactionConfirm);
  }

  void addToCart(int productId) async {
    try {
      isLoading = true;
      Map<String, dynamic> data = {
        'customer_id': customerId!,
        'product_id': productId
      };
      Map<String, dynamic> result = await _cartRepository.insertCart(data);
      isLoadingProcess = false;

      ToastService.showToast('success', result['message']);
      Get.toNamed(AppRoutes.carts);

      Cart cartResult = Cart.fromJson(result['data'][0]);
      List<Cart> productOnCart = carts
          .where((item) => item.productId == cartResult.productId)
          .toList();
      if (productOnCart.isEmpty) {
        // if result product on cart empty then insert
        carts.insert(0, cartResult);
        qtyCarts.value++;
      } else {
        // do update
        int value = productOnCart[0].quantity.value + 1;
        updateItemCart(productOnCart[0].id, value);
      }
      isLoading = false;
    } catch (e) {
      print('failed add product to cart: $e');
      ToastService.showToast('error', '$e');
    }
    update();
  }

  void deleteCart(int cartId) async {
    try {
      Map<String, dynamic> result = await _cartRepository.deleteCart(cartId);
      isLoadingProcess = false;

      ToastService.topToast('green', result['message']);
      removeItemCart(cartId);
      isLoading = false;
    } catch (e) {
      print('failed delete cart: $e');
      ToastService.topToast('red', 'error $e');
    }
  }

  Future<bool> updateCart(int qty, int cartId) async {
    try {
      Map<String, dynamic> data = {'cart_id': cartId, 'quantity': qty};
      Map<String, dynamic> result = await _cartRepository.updateCart(data);
      isLoadingProcess = false;

      ToastService.topToast('green', result['message']);
      isLoading = false;
      return true;
    } catch (e) {
      ToastService.topToast('red', 'error $e');
      return false;
    }
  }
}
