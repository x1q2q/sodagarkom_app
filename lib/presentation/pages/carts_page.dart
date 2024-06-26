import 'package:flutter/material.dart';
import '../../core/styles.dart';
import 'package:get/get.dart';
import '../controllers/carts_controller.dart';
import '../../core/assets.dart';
import '../widgets/default_appbar.dart';
import '../widgets/default_bottombar.dart';
import '../widgets/product_cart_card.dart';
import '../widgets/app_svg.dart';
import '../router/app_routes.dart';

class CartsPage extends StatelessWidget {
  final CartsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: DefaultAppbar(title: 'Keranjang'),
        bottomNavigationBar: bottomAppBar(),
        body: SafeArea(child: LayoutBuilder(builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
              child: ConstrainedBox(
                  constraints:
                      BoxConstraints(minHeight: viewportConstraints.maxHeight),
                  child: Column(children: <Widget>[listCarts(context)])));
        })));
  }

  Widget bottomAppBar() {
    return DefaultBottombar(
        widget: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
            child: ElevatedButton(
          child: Text('Belanja Lagi', style: AppStyles.btnTxtPurple),
          style: AppStyles.btnOutinePurple,
          onPressed: () {},
        )),
        SizedBox(width: 10),
        Expanded(
            child: ElevatedButton.icon(
          label: AppSvg.checkout,
          icon: Text('Checkout', style: AppStyles.btnTxtWhite),
          style: AppStyles.btnElevatedRed,
          onPressed: () {
            Get.toNamed(AppRoutes.transactionConfirm);
          },
        ))
      ],
    ));
  }

  Widget listCarts(BuildContext context) {
    return ListView.separated(
        itemCount: 4,
        shrinkWrap: true,
        separatorBuilder: (BuildContext context, int index) =>
            AppStyles.vSpaceMedium,
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return ProductCartCard(
              productName: 'Laptop Asus Aspire Pro ${index + 1}',
              productPrice: '5.000.000',
              productImage: Image.asset(Assets.dummLaptop2, fit: BoxFit.cover),
              categoryName: 'asus',
              onTapBtn: () {},
              controller: controller);
        });
  }
}
