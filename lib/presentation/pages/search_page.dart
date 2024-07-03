import 'package:flutter/material.dart';
import '../../core/styles.dart';
import 'package:get/get.dart';
import '../controllers/my_search_controller.dart';
import '../controllers/carts_controller.dart';
import '../../core/core.dart';
import '../../core/colors.dart';
import '../widgets/widgets.dart';
import '../router/app_routes.dart';
import '../../extensions/string_extensions.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  final MySearchController mySearchController = Get.find();
  final CartsController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              toolbarHeight: 58,
              backgroundColor: AppColors.lightgray,
              elevation: 0.3,
              title: TextField(
                autofocus: true,
                controller: mySearchController.txtController,
                cursorColor: AppColors.blackv1,
                decoration: InputDecoration(
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    border: null,
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Cari produk di sini ...',
                    hintStyle: AppStyles.fieldInput,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: const BorderSide(
                            width: 0, style: BorderStyle.none)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: const BorderSide(
                            width: 0, style: BorderStyle.none))),
                onSubmitted: (value) async {
                  mySearchController.searchKeywords(value);
                },
              ),
              leadingWidth: 55,
              leading: BtnCircle(
                bgColor: Colors.transparent,
                size: 35,
                widget: const Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.blackv1,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: LayoutBuilder(builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                  child: ConstrainedBox(
                      constraints: BoxConstraints(
                          minHeight: viewportConstraints.maxHeight),
                      child: GetBuilder<MySearchController>(
                          builder: (dx) => Column(children: <Widget>[
                                !dx.onSubmit.value
                                    ? filteredProducts(dx)
                                    : Column(children: <Widget>[
                                        sectionLabel(dx),
                                        dx.isGridView
                                            ? gridProducts(dx, cartController)
                                            : listProduct(dx, cartController)
                                      ])
                              ]))));
            })));
  }

  Widget productHistoryCard(dynamic controller, String id, String value) {
    return SizedBox.fromSize(
        child: Material(
            color: AppColors.lightgray,
            borderRadius: BorderRadius.circular(18),
            elevation: 0.1,
            child: InkWell(
                onTap: () {
                  controller.fillSearchField(id);
                },
                borderRadius: BorderRadius.circular(18),
                child: Container(
                    height: 40,
                    width: double.infinity,
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.lightgray),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: Row(children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: AppSvg.timeHistory),
                          Text(value, style: AppStyles.trxProductDesc)
                        ])),
                        IconButton(
                            padding: const EdgeInsets.all(6),
                            onPressed: () {
                              controller.removeHistory(id);
                            },
                            icon: AppSvg.crossHistory)
                      ],
                    )))));
  }

  Widget filteredProducts(dynamic controller) {
    return controller.isLoading.value
        ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: AppSkeleton.shimmerTransactionTotal)
        : ListView.separated(
            itemCount: controller.searchHistory!.length,
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            separatorBuilder: (BuildContext context, int index) =>
                AppStyles.vSpaceSmall,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return productHistoryCard(
                  controller,
                  controller.searchHistory![index]['id'],
                  controller.searchHistory![index]['value']);
            });
  }

  Widget sectionLabel(dynamic controller) {
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

  Widget gridProducts(dynamic controller, dynamic cartController) {
    return controller.isLoading.value
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
    return controller.isLoading.value
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
