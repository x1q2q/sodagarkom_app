import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/styles.dart';
import '../../core/colors.dart';
import '../../core/assets.dart';
import '../widgets/default_appbar.dart';
import '../widgets/default_bottombar.dart';
import '../controllers/products_controller.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductsController controller = Get.find();
  final String productId = Get.parameters['id'] ?? 'unknown';
  final double heightHeaderImg = 420.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: DefaultAppbar(title: 'Produk detail'),
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
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.white, width: 4),
            borderRadius: BorderRadius.circular(10)),
        child: Image.asset(Assets.dummLaptop2,
            height: heightHeaderImg,
            width: double.infinity,
            fit: BoxFit.cover));
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
        widget: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
            child: Text('Rp.12.000.000',
                style: AppStyles.txtRedPrice, overflow: TextOverflow.ellipsis)),
        ElevatedButton(
          child: Text('+ Keranjang', style: AppStyles.btnTxtWhite),
          style: AppStyles.btnElevatedRed,
          onPressed: () {},
        )
      ],
    ));
  }

  Widget produkContent() {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Laptop Asus Aspire 12313',
                  style: AppStyles.labelAppName,
                  overflow: TextOverflow.ellipsis),
              AppStyles.vSpaceSmall,
              Row(children: <Widget>[
                chipsProduk('Laptop Asus'),
                SizedBox(width: 10),
                chipsProduk('200 item', bgWhite: true),
              ]),
              AppStyles.vSpaceSmall,
              Text('${controller.product.value.description}',
                  textAlign: TextAlign.justify,
                  style: AppStyles.productNameTile)
            ]));
  }
}
