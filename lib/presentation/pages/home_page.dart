import 'package:flutter/material.dart';
import '../../core/styles.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../controllers/carts_controller.dart';
import '../../core/assets.dart';
import '../../core/colors.dart';
import '../widgets/app_header.dart';
import '../widgets/app_searchbar.dart';
import '../widgets/section_chips.dart';
import '../widgets/product_card.dart';
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
                    heroCategory(context),
                    sectionCategory(context),
                    gridProducts(context)
                  ])));
        })));
  }

  Widget heroCategory(BuildContext context) {
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
                      Text('Laptop Asus', style: AppStyles.labelCardCategory),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            style: btnHeroCategory,
                            onPressed: () {
                              String categoryId = '1';
                              Get.toNamed(
                                  '${AppRoutes.categoryDetail.replaceFirst(":id", categoryId)}');
                            },
                            child: Text(
                              'Detail',
                              style: AppStyles.btnTxtCardCategory,
                            )),
                      )
                    ]),
              ),
              Image.asset(Assets.dummCategory, width: 160, height: 160)
            ]));
  }

  Widget sectionCategory(BuildContext context) {
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
              SectionChips(controller: controller)
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
              productImage: Image.asset(Assets.dummLaptop, fit: BoxFit.cover),
              onTapCard: () {},
              onTapBtn: () {});
        });
  }
}
