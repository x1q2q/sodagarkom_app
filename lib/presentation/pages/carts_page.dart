import 'package:flutter/material.dart';
import '../../core/styles.dart';
import 'package:get/get.dart';
import '../controllers/carts_controller.dart';
import '../../core/core.dart';
import '../../core/colors.dart';
import '../widgets/widgets.dart';
import '../router/app_routes.dart';
import '../../extensions/string_extensions.dart';

class CartsPage extends StatelessWidget {
  const CartsPage({super.key});
  @override
  Widget build(BuildContext context) {
    final CartsController cartController = Get.find();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const DefaultAppbar(title: 'Keranjang'),
        body: RefreshIndicator(
            backgroundColor: AppColors.redv2,
            color: Colors.white,
            strokeWidth: 2.0,
            onRefresh: () async {
              cartController.handleRefresh();
            },
            child: SafeArea(child: LayoutBuilder(builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: ConstrainedBox(
                      constraints: BoxConstraints(
                          minHeight: viewportConstraints.maxHeight),
                      child: GetBuilder<CartsController>(
                          builder: (dx) => Column(
                              children: <Widget>[listCarts(context, dx)]))));
            }))),
        bottomNavigationBar:
            GetBuilder<CartsController>(builder: (dx) => bottomAppBar(dx)));
  }

  Widget bottomAppBar(dynamic controller) {
    return DefaultBottombar(
        widget: controller.isLoading
            ? AppSkeleton.bottomBar
            : controller.carts!.length > 0
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                          child: ElevatedButton(
                              style: AppStyles.btnOutinePurple,
                              onPressed: () {
                                Get.until((route) =>
                                    route.settings.name == AppRoutes.appTab);
                              },
                              child: const Text('Belanja Lagi',
                                  style: AppStyles.btnTxtPurple))),
                      const SizedBox(width: 10),
                      Expanded(
                          child: ElevatedButton.icon(
                              label: AppSvg.checkout,
                              icon: const Text('Checkout',
                                  style: AppStyles.btnTxtWhite),
                              style: AppStyles.btnElevatedRed,
                              onPressed: controller.goTransactionConfirm))
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                        Expanded(
                            child: ElevatedButton(
                                style: AppStyles.btnOutinePurple,
                                onPressed: () {
                                  Get.until((route) =>
                                      route.settings.name == AppRoutes.appTab);
                                },
                                child: const Text('Yuk Belanja!',
                                    style: AppStyles.btnTxtPurple)))
                      ]));
  }

  Widget listCarts(BuildContext context, dynamic controller) {
    return controller.isLoading
        ? Padding(
            padding: const EdgeInsets.only(top: 20),
            child: AppSkeleton.shimmerListView)
        : ListView.separated(
            itemCount: controller.carts!.length,
            shrinkWrap: true,
            separatorBuilder: (BuildContext context, int index) =>
                AppStyles.vSpaceSmall,
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              var cart = controller.carts[index];
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
