import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/styles.dart';
import '../../core/colors.dart';
import '../../core/core.dart';
import '../controllers/category_detail_controller.dart';
import '../widgets/widgets.dart';
import '../router/app_routes.dart';

class CategoryDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: DefaultAppbar(title: 'Kategori Detail'),
        body: SafeArea(child: LayoutBuilder(builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
              child: ConstrainedBox(
                  constraints:
                      BoxConstraints(minHeight: viewportConstraints.maxHeight),
                  child: GetBuilder<CategoryDetailController>(
                      builder: (dx) => Column(children: <Widget>[
                            curtainCategory(context, dx),
                            sectionLabel(context, dx),
                            dx.isGridView
                                ? gridProducts(context, dx)
                                : listProduct(context, dx)
                          ]))));
        })));
  }

  Widget curtainCategory(BuildContext context, dynamic controller) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 25, 20, 20),
      height: 228.0,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        controller.isLoading
                            ? AppSkeleton.shimmerCategory
                            : Text('${controller.category!.name}',
                                style: AppStyles.labelCategoryPurple),
                        AppStyles.vSpaceSmall,
                        controller.isLoading
                            ? AppSkeleton.shimmerImgSmall
                            : (controller.category!.imageThumb == '')
                                ? AppSvg.imgNotFound
                                : Image.network(
                                    '${Core.pathAssetsCategory}${controller.category!.imageThumb}',
                                    width: 110,
                                    height: 110)
                      ])),
              Expanded(
                  child: controller.isLoading
                      ? AppSkeleton.shimmerDescription
                      : Text('${controller.category!.description}',
                          textAlign: TextAlign.justify,
                          maxLines: 6,
                          overflow: TextOverflow.ellipsis,
                          style: AppStyles.btnTxtCardCategory))
            ],
          ),
          Center(
            child: Text(
              controller.isLoading
                  ? '... items'
                  : '${controller.category!.products!.length} items',
              style: AppStyles.productNameGrid,
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
          color: AppColors.lightpurple,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30))),
    );
  }

  Widget sectionLabel(BuildContext context, dynamic controller) {
    return Padding(
        padding: EdgeInsets.fromLTRB(20, 25, 20, 25),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Produk Terkait', style: AppStyles.labelSection),
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
            padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return ProductTileCard(
                  productName: '${controller.category!.products![index].name}',
                  productPrice:
                      'Rp. ${controller.category!.products![index].price}',
                  productImage: (controller
                              .category!.products![index].imageThumb ==
                          '')
                      ? AppSvg.imgNotFound
                      : Image.network(
                          '${Core.pathAssetsProduct}${controller.category!.products![index].imageThumb}',
                          fit: BoxFit.cover),
                  onTapCard: () {
                    String productId =
                        controller.category!.products![index].id.toString();
                    Get.toNamed(
                        '${AppRoutes.productDetail.replaceFirst(":id", productId)}');
                  },
                  onTapBtn: () {},
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
            padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext ctx, index) {
              return ProductCard(
                  productName: '${controller.category!.products![index].name}',
                  productPrice:
                      'Rp. ${controller.category!.products![index].price}',
                  productImage: (controller
                              .category!.products![index].imageThumb ==
                          '')
                      ? AppSvg.imgNotFound
                      : Image.network(
                          '${Core.pathAssetsProduct}${controller.category!.products![index].imageThumb}',
                          fit: BoxFit.cover),
                  onTapCard: () {
                    String productId =
                        controller.category!.products![index].id.toString();
                    Get.toNamed(
                        '${AppRoutes.productDetail.replaceFirst(":id", productId)}');
                  },
                  onTapBtn: () {});
            });
  }
}
