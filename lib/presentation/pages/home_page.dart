import 'package:flutter/material.dart';
import '../../core/styles.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../controllers/carts_controller.dart';
import '../../core/colors.dart';
import '../../core/core.dart';
import '../widgets/widgets.dart';
import '../router/app_routes.dart';

class HomePage extends StatelessWidget {
  final HomeController controller = Get.find();
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
                  child: GetBuilder<HomeController>(
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
                            heroCategory(context, dx),
                            sectionCategory(context, dx),
                            gridProducts(context, dx)
                          ]))));
        })));
  }

  Widget heroCategory(BuildContext context, dynamic controller) {
    ButtonStyle btnHeroCategory = ElevatedButton.styleFrom(
      elevation: 0.2,
      backgroundColor: Colors.white,
      foregroundColor: AppColors.purplev1,
      padding: EdgeInsets.symmetric(horizontal: 10),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
    );
    return Container(
        height: 204,
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: AppColors.purplev1),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                width: 160,
                padding: EdgeInsets.all(5),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      controller.isLoading
                          ? AppSkeleton.shimmerCategory
                          : Text(controller.category!.name,
                              style: AppStyles.labelCategory),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            style: btnHeroCategory,
                            onPressed: () {
                              String categoryId =
                                  controller.category!.id.toString();
                              Get.toNamed(
                                  '${AppRoutes.categoryDetail.replaceFirst(":id", categoryId)}');
                            },
                            child: const Text(
                              'Detail',
                              style: AppStyles.btnTxtCardCategory,
                            )),
                      )
                    ]),
              ),
              controller.isLoading
                  ? AppSkeleton.shimmerImgSmall
                  : (controller.category!.imageThumb == '')
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
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Kategori',
                style: AppStyles.labelSection,
              ),
              controller.isLoading
                  ? AppSkeleton.shimmerPrice
                  : Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.categories.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Obx(() => Padding(
                                padding: EdgeInsets.only(right: 4),
                                child: ChoiceChip(
                                  color: MaterialStateProperty.resolveWith(
                                      (states) {
                                    return states
                                            .contains(MaterialState.selected)
                                        ? AppColors.redv2
                                        : Colors.white;
                                  }),
                                  showCheckmark: false,
                                  label: Text(
                                    '${controller.categories[index].name}',
                                  ),
                                  labelStyle: TextStyle(
                                      fontFamily: 'PlusJakarta',
                                      fontWeight: FontWeight.w500,
                                      color: (controller.idChipSelected.value ==
                                              controller.categories[index].id)
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 15),
                                  selected: controller.idChipSelected.value ==
                                      controller.categories[index].id,
                                  onSelected: (bool selected) {
                                    if (controller.idChipSelected.value !=
                                        controller.categories[index].id) {
                                      // prevent for double click on the same chip
                                      controller.changeChip(selected,
                                          controller.categories[index].id);
                                      controller.fetchCategoryId(controller
                                          .categories[index].id
                                          .toString());
                                    }
                                  },
                                )));
                          }))
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
            itemCount: controller.category!.products!.length,
            shrinkWrap: true,
            padding: EdgeInsets.fromLTRB(20, 0, 20, 25),
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
