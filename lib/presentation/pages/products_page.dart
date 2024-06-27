import 'package:flutter/material.dart';
import '../../core/styles.dart';
import 'package:get/get.dart';
import '../controllers/products_controller.dart';
import '../controllers/carts_controller.dart';
import '../../core/core.dart';
import '../../core/colors.dart';
import '../widgets/widgets.dart';
import '../router/app_routes.dart';

class ProductsPage extends StatelessWidget {
  final ProductsController controller = Get.find();
  final CartsController cartsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(child: LayoutBuilder(builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
              child: ConstrainedBox(
                  constraints:
                      BoxConstraints(minHeight: viewportConstraints.maxHeight),
                  child: GetBuilder<ProductsController>(
                      builder: (dx) => Column(children: <Widget>[
                            Container(
                              padding: EdgeInsets.fromLTRB(20, 25, 20, 0),
                              height: 165.0,
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  AppHeader(controller: cartsController),
                                  const AppSearchbar(),
                                ],
                              ),
                            ),
                            sectionLabel(context),
                            dx.isGridView
                                ? gridProducts(context, dx)
                                : listProduct(context, dx)
                          ]))));
        })));
  }

  Widget sectionLabel(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(20, 25, 20, 25),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Semua Produk', style: AppStyles.labelSection),
              GetBuilder<ProductsController>(
                  builder: (dx) => BtnRounded(
                        widget:
                            dx.isGridView ? AppSvg.gridView : AppSvg.listView,
                        bgColor: AppColors.lightpurple,
                        splashColor: AppColors.purplev1,
                        onTap: controller.changeTypeView,
                      ))
            ]));
  }

  Widget gridProducts(BuildContext context, dynamic controller) {
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
            padding: EdgeInsets.fromLTRB(20, 0, 20, 25),
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext ctx, index) {
              return ProductCard(
                  productName: '${controller.products[index].name}',
                  productPrice: 'Rp. ${controller.products[index].price}',
                  productImage: (controller.products[index].imageThumb == '')
                      ? AppSvg.imgNotFound
                      : Image.network(
                          '${Core.pathAssetsProduct}${controller.products[index].imageThumb}',
                          fit: BoxFit.cover),
                  onTapCard: () {
                    String productId = controller.products[index].id.toString();
                    Get.toNamed(
                        '${AppRoutes.productDetail.replaceFirst(":id", productId)}');
                  },
                  onTapBtn: () {});
            });
  }

  Widget listProduct(BuildContext context, dynamic controller) {
    return controller.isLoading
        ? AppSkeleton.shimmerListView
        : ListView.separated(
            itemCount: controller.products.length,
            shrinkWrap: true,
            separatorBuilder: (BuildContext context, int index) =>
                AppStyles.vSpaceSmall,
            padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return ProductTileCard(
                  productName: '${controller.products[index].name}',
                  productPrice: 'Rp. ${controller.products[index].price}',
                  productImage: (controller.products[index].imageThumb == '')
                      ? AppSvg.imgNotFound
                      : Image.network(
                          '${Core.pathAssetsProduct}${controller.products[index].imageThumb}',
                          fit: BoxFit.cover),
                  onTapCard: () {
                    String productId = controller.products[index].id.toString();
                    Get.toNamed(
                        '${AppRoutes.productDetail.replaceFirst(":id", productId)}');
                  },
                  onTapBtn: () {},
                  controller: controller);
            });
  }
}
