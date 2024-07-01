import 'package:flutter/material.dart';
import '../../core/styles.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../controllers/carts_controller.dart';
import '../../core/colors.dart';
import '../../core/core.dart';
import '../widgets/widgets.dart';
import '../router/app_routes.dart';
import '../../extensions/string_extensions.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final CartsController cartController = Get.find();
    final HomeController homeController = Get.find();
    return Scaffold(
        backgroundColor: Colors.white,
        body: RefreshIndicator(
            backgroundColor: AppColors.redv2,
            color: Colors.white,
            strokeWidth: 2.0,
            onRefresh: () async {
              homeController.handleRefresh();
              cartController.handleRefresh();
            },
            child: SafeArea(child: LayoutBuilder(builder:
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              AppHeader(controller: cartController),
                              const AppSearchbar(),
                            ],
                          ),
                        ),
                        GetBuilder<HomeController>(
                            builder: (dx) => Column(children: <Widget>[
                                  heroCategory(context, dx),
                                  sectionCategory(context, dx),
                                  gridProducts(context, dx)
                                ]))
                      ])));
            }))));
  }

  Widget heroCategory(BuildContext context, dynamic controller) {
    ButtonStyle btnHeroCategory = ElevatedButton.styleFrom(
      elevation: 0.2,
      backgroundColor: Colors.white,
      foregroundColor: AppColors.purplev1,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
    );
    return Container(
        height: 204,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: controller.isLoading
                ? Colors.grey.shade50
                : AppColors.purplev1),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                width: 160,
                padding: const EdgeInsets.all(5),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      controller.isLoading
                          ? AppSkeleton.shimmerCategoryMd
                          : Text(controller.category!.name,
                              style: AppStyles.labelCategory),
                      controller.isLoading
                          ? AppSkeleton.shimmerBtn
                          : SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  style: btnHeroCategory,
                                  onPressed: () {
                                    String categoryId =
                                        controller.category!.id.toString();
                                    Get.toNamed(AppRoutes.categoryDetail
                                        .replaceFirst(":id", categoryId));
                                  },
                                  child: const Text(
                                    'Detail',
                                    style: AppStyles.btnTxtCardCategory,
                                  )),
                            )
                    ]),
              ),
              controller.isLoading
                  ? AppSkeleton.shimmerImgMd
                  : (controller.category!.imageThumb.isEmpty)
                      ? AppSvg.imgNotFound
                      : Image.network(
                          '${Core.pathAssetsCategory}${controller.category!.imageThumb}',
                          width: 160,
                          height: 160)
            ]));
  }

  Widget sectionCategory(BuildContext context, dynamic controller) {
    return Container(
        width: double.infinity,
        height: 90,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Kategori',
                style: AppStyles.labelSection,
              ),
              controller.isLoading
                  ? AppSkeleton.shimmerChips
                  : SectionChips(controller: controller)
            ]));
  }

  Widget gridProducts(BuildContext context, dynamic controller) {
    final CartsController cartController = Get.find();
    return controller.isLoading
        ? AppSkeleton.shimmerGridView
        : GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 20 / 23,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10),
            itemCount: controller.category!.products!.length,
            shrinkWrap: true,
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 25),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext ctx, index) {
              var products = controller.category!.products![index];
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
}
