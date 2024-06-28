import 'package:flutter/material.dart';
import '../../core/styles.dart';
import 'package:get/get.dart';
import '../controllers/carts_controller.dart';
import '../../core/core.dart';
import '../widgets/widgets.dart';
import '../router/app_routes.dart';
import '../../extensions/string_extensions.dart';

class CartsPage extends StatelessWidget {
  const CartsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const DefaultAppbar(title: 'Keranjang'),
        bottomNavigationBar: bottomAppBar(),
        body: SafeArea(child: LayoutBuilder(builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
              child: ConstrainedBox(
                  constraints:
                      BoxConstraints(minHeight: viewportConstraints.maxHeight),
                  child: GetBuilder<CartsController>(
                      builder: (dx) =>
                          Column(children: <Widget>[listCarts(context, dx)]))));
        })));
  }

  Widget bottomAppBar() {
    return DefaultBottombar(
        widget: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
            child: ElevatedButton(
          child: Text('Belanja Lagi', style: AppStyles.btnTxtPurple),
          style: AppStyles.btnOutinePurple,
          onPressed: () {},
        )),
        SizedBox(width: 10),
        Expanded(
            child: ElevatedButton.icon(
          label: AppSvg.checkout,
          icon: const Text('Checkout', style: AppStyles.btnTxtWhite),
          style: AppStyles.btnElevatedRed,
          onPressed: () {
            Get.toNamed(AppRoutes.transactionConfirm);
          },
        ))
      ],
    ));
  }

  Widget listCarts(BuildContext context, dynamic controller) {
    return controller.isLoading
        ? AppSkeleton.shimmerListView
        : ListView.separated(
            itemCount: controller.carts!.length,
            shrinkWrap: true,
            separatorBuilder: (BuildContext context, int index) =>
                AppStyles.vSpaceMedium,
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              var cart = controller.carts[index];
              ;
              return ProductCartCard(
                  cartId: cart.id,
                  productName: cart.productName,
                  productQuantity: cart.quantity,
                  productPrice: '${cart.productPrice}'.toRupiah(),
                  productImage: (cart.productImage.isEmpty)
                      ? AppSvg.imgNotFound
                      : Image.network(
                          '${Core.pathAssetsProduct}${cart.productImage}',
                          fit: BoxFit.cover),
                  categoryName: '${cart.categoryName}',
                  controller: controller);
            });
  }
}
