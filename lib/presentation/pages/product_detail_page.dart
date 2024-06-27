import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/styles.dart';
import '../../core/colors.dart';
import '../../core/core.dart';
import '../widgets/widgets.dart';
import '../controllers/product_detail_controller.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductDetailController controller = Get.find();
  final double heightHeaderImg = 420.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: DefaultAppbar(title: 'Produk Detail'),
        bottomNavigationBar: bottomAppBar(),
        body: SafeArea(child: LayoutBuilder(builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
              child: ConstrainedBox(
                  constraints:
                      BoxConstraints(minHeight: viewportConstraints.maxHeight),
                  child: Column(children: <Widget>[
                    Container(
                      height: heightHeaderImg,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(color: AppColors.lightgray),
                      child: produkHeader(),
                    ),
                    produkContent(),
                  ])));
        })));
  }

  Widget produkHeader() {
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.white, width: 4),
            borderRadius: BorderRadius.circular(10)),
        child: Obx(() => controller.isLoading.value
            ? AppSkeleton.shimmerImg
            : (controller.product!.imageThumb == '')
                ? AppSvg.imgNotFoundPotrait
                : Image.network(
                    '${Core.pathAssetsProduct}${controller.product!.imageThumb}',
                    fit: BoxFit.cover)));
  }

  Widget chipsProduk(String text, {bool bgWhite = false}) {
    return Container(
        decoration: BoxDecoration(
          color: !bgWhite ? AppColors.purplev1 : Colors.white,
          border: Border.all(color: AppColors.purplev1),
          borderRadius: BorderRadius.circular(30),
        ),
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
        child: Text(text,
            style: TextStyle(
                fontFamily: 'PlusJakarta',
                fontWeight: FontWeight.w700,
                color: !bgWhite ? Colors.white : AppColors.purplev1,
                fontSize: 14)));
  }

  Widget bottomAppBar() {
    return DefaultBottombar(
        widget: Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                controller.isLoading.value
                    ? AppSkeleton.shimmerPrice
                    : Expanded(
                        child: Text('Rp.${controller.product!.price}',
                            style: AppStyles.txtRedPrice,
                            overflow: TextOverflow.ellipsis)),
                ElevatedButton(
                  child: Text('+ Keranjang', style: AppStyles.btnTxtWhite),
                  style: AppStyles.btnElevatedRed,
                  onPressed: () {},
                )
              ],
            )));
  }

  Widget produkContent() {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        child: Obx(() => controller.isLoading.value
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
                      SizedBox(width: 10),
                      chipsProduk('${controller.product!.stock} item',
                          bgWhite: true),
                    ]),
                    AppStyles.vSpaceSmall,
                    Text('${controller.product!.description}',
                        textAlign: TextAlign.justify,
                        style: AppStyles.productNameTile)
                  ])));
  }
}
