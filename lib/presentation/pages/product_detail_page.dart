import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/styles.dart';
import '../../core/colors.dart';
import '../../core/core.dart';
import '../widgets/widgets.dart';
import '../controllers/product_detail_controller.dart';
import '../controllers/carts_controller.dart';
import '../../extensions/string_extensions.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});
  final double heightHeaderImg = 420.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const DefaultAppbar(title: 'Produk Detail'),
        body: SafeArea(child: LayoutBuilder(builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
              child: ConstrainedBox(
                  constraints:
                      BoxConstraints(minHeight: viewportConstraints.maxHeight),
                  child: GetBuilder<ProductDetailController>(
                      builder: (dx) => Column(children: <Widget>[
                            Container(
                              height: heightHeaderImg,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(20),
                              decoration: const BoxDecoration(
                                  color: AppColors.lightgray),
                              child: produkHeader(dx),
                            ),
                            produkContent(dx),
                          ]))));
        })),
        bottomNavigationBar: GetBuilder<ProductDetailController>(
            builder: (dx) => bottomAppBar(dx)));
  }

  Widget produkHeader(dynamic controller) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.white, width: 4),
            borderRadius: BorderRadius.circular(10)),
        child: controller.isLoading
            ? AppSkeleton.shimmerImg
            : (controller.product!.imageThumb.isEmpty)
                ? AppSvg.imgNotFoundPotrait
                : Image.network(
                    '${Core.pathAssetsProduct}${controller.product!.imageThumb}',
                    fit: BoxFit.contain));
  }

  Widget chipsProduk(String text, {bool bgWhite = false}) {
    return Container(
        decoration: BoxDecoration(
          color: !bgWhite ? AppColors.purplev1 : Colors.white,
          border: Border.all(color: AppColors.purplev1),
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
        child: Text(text,
            style: TextStyle(
                fontFamily: 'PlusJakarta',
                fontWeight: FontWeight.w700,
                color: !bgWhite ? Colors.white : AppColors.purplev1,
                fontSize: 14)));
  }

  Widget bottomAppBar(dynamic controller) {
    final CartsController cartController = Get.find();
    return DefaultBottombar(
        widget: controller.isLoading
            ? AppSkeleton.bottomBarProduk
            : (controller.product != null)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                          child: Text('${controller.product!.price}'.toRupiah(),
                              style: AppStyles.txtRedPrice,
                              overflow: TextOverflow.ellipsis)),
                      ElevatedButton(
                        style: AppStyles.btnElevatedRed,
                        onPressed: () {
                          cartController
                              .addToCart(int.parse(controller.productId));
                        },
                        child: const Text('+ Keranjang',
                            style: AppStyles.btnTxtWhite),
                      )
                    ],
                  )
                : Text('kosong'));
  }

  Widget produkContent(dynamic controller) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        child: controller.isLoading
            ? AppSkeleton.shimmerDetail
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                    Text(controller.product!.name,
                        style: AppStyles.labelAppName,
                        overflow: TextOverflow.ellipsis),
                    AppStyles.vSpaceSmall,
                    Row(children: <Widget>[
                      chipsProduk(controller.product!.categoryName),
                      const SizedBox(width: 10),
                      chipsProduk('${controller.product!.stock} item',
                          bgWhite: true),
                    ]),
                    AppStyles.vSpaceSmall,
                    Text(controller.product!.description,
                        textAlign: TextAlign.justify,
                        style: AppStyles.productNameTile)
                  ]));
  }
}
