import 'package:flutter/material.dart';
import '../../core/styles.dart';
import 'package:get/get.dart';
import '../controllers/products_controller.dart';
import '../controllers/carts_controller.dart';
import '../../core/assets.dart';
import '../../core/colors.dart';
import '../widgets/app_svg.dart';
import '../widgets/btn_rounded.dart';
import '../widgets/product_card.dart';
import '../widgets/app_header.dart';
import '../widgets/app_searchbar.dart';
import '../widgets/product_tile_card.dart';
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
                  child: Column(children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 25, 20, 0),
                      height: 165.0,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          AppHeader(controller: cartsController),
                          const AppSearchbar(),
                        ],
                      ),
                    ),
                    sectionLabel(context),
                    Obx(() => controller.isGridView.value
                        ? gridProducts(context)
                        : listProduct(context))
                  ])));
        })));
  }

  Widget sectionLabel(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(20, 25, 20, 25),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Semua Produk', style: AppStyles.labelSection),
              Obx(() => BtnRounded(
                    widget: controller.isGridView.value
                        ? AppSvg.gridView
                        : AppSvg.listView,
                    bgColor: AppColors.lightpurple,
                    splashColor: AppColors.purplev1,
                    onTap: controller.changeTypeView,
                  ))
            ]));
  }

  Widget gridProducts(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 20 / 23,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10),
        itemCount: 11,
        shrinkWrap: true,
        padding: EdgeInsets.fromLTRB(20, 0, 20, 25),
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext ctx, index) {
          return ProductCard(
              productName: 'Asus Aspire Pro',
              productPrice: 'Rp.25.000.000',
              productImage: Image.asset(Assets.dummLaptop2, fit: BoxFit.cover),
              onTapCard: () {
                String productId = '1';
                Get.toNamed(
                    '${AppRoutes.productDetail.replaceFirst(":id", productId)}');
              },
              onTapBtn: () {});
        });
  }

  Widget listProduct(BuildContext context) {
    return ListView.separated(
        itemCount: 10,
        shrinkWrap: true,
        separatorBuilder: (BuildContext context, int index) =>
            AppStyles.vSpaceSmall,
        padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return ProductTileCard(
              productName: 'Laptop Asus Aspire Pro ${index + 1}',
              productPrice: 'Rp.5000.000',
              productImage: Image.asset(Assets.dummLaptop2, fit: BoxFit.cover),
              onTapCard: () {
                String productId = '1';
                Get.toNamed(
                    '${AppRoutes.productDetail.replaceFirst(":id", productId)}');
              },
              onTapBtn: () {},
              controller: controller);
        });
  }
}
