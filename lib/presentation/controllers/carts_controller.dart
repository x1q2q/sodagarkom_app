import 'package:get/get.dart';
import '../../domain/repositories/cart_repository.dart';
import '../../domain/models/cart.dart';
import '../router/app_routes.dart';

class CartsController extends GetxController {
  final CartRepository _cartRepository;

  CartsController(this._cartRepository);
  var carts = <Cart>[].obs;
  bool isLoading = true;
  var qtyCarts = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCarts();
  }

  void goToCarts() {
    Get.toNamed(AppRoutes.carts);
  }

  void incrementItemCart(int cartId) {
    for (var cart in carts) {
      if (cart.id == cartId) {
        cart.quantity.value += 1;
        update();
      }
    }
  }

  void decrementItemCart(int cartId) {
    for (var cart in carts) {
      if (cart.id == cartId) {
        if (cart.quantity > 1) {
          cart.quantity.value -= 1;
        } else {
          carts.remove(cart);
        }
        update();
      }
    }
  }

  void removeItemCart(int cartId) {
    for (var cart in carts) {
      if (cart.id == cartId) {
        carts.remove(cart);
        update();
      }
    }
  }

  void fetchCarts() async {
    try {
      String customerId = '9';
      List<Cart> fetchedCarts = await _cartRepository.getCarts(customerId);
      isLoading = false;
      carts.assignAll(fetchedCarts);
      qtyCarts.value = fetchedCarts.length;
    } catch (e) {
      print('failed to fetch carts: $e');
    }
    update();
  }
}
