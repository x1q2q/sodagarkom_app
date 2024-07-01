import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/styles.dart';
import '../../core/colors.dart';
import '../../core/core.dart';
import '../controllers/category_detail_controller.dart';
import '../widgets/widgets.dart';
import '../router/app_routes.dart';
import '../../extensions/string_extensions.dart';

class CategoryDetailPage extends StatelessWidget {
  const CategoryDetailPage({super.key});
  @override
  Widget build(BuildContext context) {
    final CategoryDetailController categoryController = Get.find();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const DefaultAppbar(title: 'Kategori Detail'),
        body: RefreshIndicator(
            backgroundColor: AppColors.redv2,
            color: Colors.white,
            strokeWidth: 2.0,
            onRefresh: () async {
              categoryController.handleRefresh();
            },
            child: SafeArea(child: LayoutBuilder(builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                  child: ConstrainedBox(
                      constraints: BoxConstraints(
                          minHeight: viewportConstraints.maxHeight),
                      child: GetBuilder<CategoryDetailController>(
                          builder: (dx) => Column(children: <Widget>[
                                curtainCategory(context, dx),
                                sectionLabel(context, dx),
                                dx.isGridView
                                    ? gridProducts(context, dx)
                                    : listProduct(context, dx)
                              ]))));
            }))));
  }

  Widget curtainCategory(BuildContext context, dynamic controller) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      height: 228.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: controller.isLoading
              ? Colors.grey.shade50
              : AppColors.lightpurple,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30))),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      width: width / 4,
                      margin: EdgeInsets.only(right: 5),
                      height: 160,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            controller.isLoading
                                ? AppSkeleton.shimmerCategory
                                : Text('${controller.category!.name}',
                                    style: AppStyles.labelCategoryPurple),
                            AppStyles.vSpaceSmall,
                            controller.isLoading
                                ? AppSkeleton.shimmerImgSmall
                                : (controller.category!.imageThumb.isEmpty)
                                    ? AppSvg.imgNotFound
                                    : Image.network(
                                        '${Core.pathAssetsCategory}${controller.category!.imageThumb}',
                                        width: width / 4,
                                        height: 80)
                          ])),
                  Expanded(
                      child: controller.isLoading
                          ? AppSkeleton.shimmerDescription
                          : Text('${controller.category!.description}',
                              textAlign: TextAlign.justify,
                              maxLines: 6,
                              overflow: TextOverflow.ellipsis,
                              style: AppStyles.btnTxtCardCategory))
                ]),
            Center(
                child: Text(
                    controller.isLoading
                        ? '... items'
                        : '${controller.category!.products!.length} items',
                    style: AppStyles.productNameGrid))
          ]),
    );
  }

  Widget sectionLabel(BuildContext context, dynamic controller) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(20, 25, 20, 25),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text('Produk Terkait', style: AppStyles.labelSection),
              BtnRounded(
                widget:
                    controller.isGridView ? AppSvg.gridView : AppSvg.listView,
                bgColor: AppColors.lightpurple,
                splashColor: AppColors.purplev1,
                onTap: controller.changeTypeView,
              )
            ]));
  }

  Widget listProduct(BuildContext context, dynamic controller) {
    return controller.isLoading
        ? AppSkeleton.shimmerListView
        : ListView.separated(
            itemCount: controller.category!.products!.length,
            shrinkWrap: true,
            separatorBuilder: (BuildContext context, int index) =>
                AppStyles.vSpaceSmall,
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              var products = controller.category!.products![index];
              return ProductTileCard(
                  productId: '${products.id}',
                  productName: products.name,
                  productPrice: '${products.price}'.toRupiah(),
                  productImage: (products.imageThumb.isEmpty)
                      ? AppSvg.imgNotFound
                      : Image.network(
                          '${Core.pathAssetsProduct}${products.imageThumb}',
                          fit: BoxFit.cover),
                  onTapCard: () {
                    Get.toNamed(AppRoutes.productDetail
                        .replaceFirst(":id", '${products.id}'));
                  },
                  controller: controller);
            });
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
            itemCount: controller.category!.products!.length,
            shrinkWrap: true,
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
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
                          fit: BoxFit.cover),
                  onTapCard: () {
                    Get.toNamed(AppRoutes.productDetail
                        .replaceFirst(":id", '${products.id}'));
                  },
                  onTapBtn: () {});
            });
  }
}
