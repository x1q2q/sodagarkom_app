import 'package:get/get.dart';
import '../../domain/repositories/cart_repository.dart';
import '../../domain/models/cart.dart';
import '../router/app_routes.dart';

class CartsController extends GetxController {
  final CartRepository _cartRepository;

  CartsController(this._cartRepository);
  var carts = Cart(
          id: 0,
          productId: 0,
          userId: 0,
          quantity: 0,
          productName: 'product1',
          productPrice: 50000,
          categoryName: 'asus',
          addedDate: '2024-10-12')
      .obs;

  var qtyCarts = 9.obs;
  var itemQty = 3.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void goToCarts() {
    Get.toNamed(AppRoutes.carts);
  }

  void incrementItemCart() {
    itemQty.value++;
  }

  void decrementItemCart() {
    itemQty.value--;
  }

  void fetchCarts() async {}
}
