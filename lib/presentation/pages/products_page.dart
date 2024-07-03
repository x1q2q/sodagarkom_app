import 'package:flutter/material.dart';
import '../../core/styles.dart';
import 'package:get/get.dart';
import '../controllers/products_controller.dart';
import '../controllers/carts_controller.dart';
import '../../core/core.dart';
import '../../core/colors.dart';
import '../widgets/widgets.dart';
import '../router/app_routes.dart';
import '../../extensions/string_extensions.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});
  @override
  Widget build(BuildContext context) {
    final ProductsController productController = Get.find();
    final CartsController cartController = Get.find();
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: RefreshIndicator(
                backgroundColor: AppColors.redv2,
                color: Colors.white,
                strokeWidth: 2.0,
                onRefresh: () async {
                  productController.handleRefresh();
                  cartController.handleRefresh();
                },
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints viewportConstraints) {
                  return SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: ConstrainedBox(
                          constraints: BoxConstraints(
                              minHeight: viewportConstraints.maxHeight),
                          child: Column(children: <Widget>[
                            Container(
                              padding: const EdgeInsets.fromLTRB(20, 25, 20, 0),
                              height: 165.0,
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  AppHeader(controller: cartController),
                                  const AppSearchbar(),
                                ],
                              ),
                            ),
                            GetBuilder<ProductsController>(
                                builder: (dx) => Column(children: <Widget>[
                                      sectionLabel(dx),
                                      dx.isGridView
                                          ? gridProducts(dx, cartController)
                                          : listProduct(dx, cartController)
                                    ]))
                          ])));
                }))));
  }

  Widget sectionLabel(dynamic controller) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(20, 25, 20, 25),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text('Semua Produk', style: AppStyles.labelSection),
              BtnRounded(
                widget:
                    controller.isGridView ? AppSvg.gridView : AppSvg.listView,
                bgColor: AppColors.lightpurple,
                splashColor: AppColors.purplev1,
                onTap: controller.changeTypeView,
              )
            ]));
  }

  Widget gridProducts(dynamic controller, dynamic cartController) {
    return controller.isLoading
        ? AppSkeleton.shimmerGridView
        : GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 20 / 23,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10),
            itemCount: controller.products.length,
            shrinkWrap: true,
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 25),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext ctx, index) {
              var products = controller.products![index];
              return ProductCard(
                  productName: products.name,
                  productPrice: '${products.price}'.toRupiah(),
                  productImage: (products.imageThumb.isEmpty)
                      ? AppSvg.imgNotFound
                      : Image.network(
                          '${Core.pathAssetsProduct}${products.imageThumb}',
                          fit: BoxFit.contain),
                  onTapCard: () {
                    Get.toNamed(AppRoutes.productDetail
                        .replaceFirst(":id", '${products.id}'));
                  },
                  onTapBtn: () {
                    cartController.addToCart(products.id);
                  });
            });
  }

  Widget listProduct(dynamic controller, dynamic cartController) {
    return controller.isLoading
        ? AppSkeleton.shimmerListView
        : ListView.separated(
            itemCount: controller.products.length,
            shrinkWrap: true,
            separatorBuilder: (BuildContext context, int index) =>
                AppStyles.vSpaceSmall,
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              var products = controller.products![index];
              return ProductTileCard(
                  productId: '${products.id}',
                  productName: products.name,
                  productPrice: '${products.price}'.toRupiah(),
                  productImage: (products.imageThumb.isEmpty)
                      ? AppSvg.imgNotFound
                      : Image.network(
                          '${Core.pathAssetsProduct}${products.imageThumb}',
                          fit: BoxFit.contain),
                  onTapCard: () {
                    Get.toNamed(AppRoutes.productDetail
                        .replaceFirst(":id", '${products.id}'));
                  },
                  controller: cartController);
            });
  }
}
