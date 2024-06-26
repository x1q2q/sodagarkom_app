import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/styles.dart';
import '../../core/colors.dart';
import '../../core/assets.dart';
import '../controllers/category_detail_controller.dart';
import '../widgets/widgets.dart';

class CategoryDetailPage extends StatelessWidget {
  final CategoryDetailController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    // final String categoryId = Get.parameters['id'] ?? 'unknown';
    // String titleBar = '$controller.dumpCategory.value.name';
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: DefaultAppbar(title: '${controller.dumpCategory.value.name}'),
        body: SafeArea(child: LayoutBuilder(builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
              child: ConstrainedBox(
                  constraints:
                      BoxConstraints(minHeight: viewportConstraints.maxHeight),
                  child: Column(children: <Widget>[
                    curtainCategory(context),
                    sectionLabel(context),
                    Obx(() => controller.isGridView.value
                        ? gridProducts(context)
                        : listProduct(context))
                  ])));
        })));
  }

  Widget curtainCategory(BuildContext context) {
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
                child: Image.asset(Assets.dummCategory, height: 120),
              ),
              Expanded(
                  child: Text('${controller.dumpCategory.value.description}',
                      textAlign: TextAlign.justify,
                      style: AppStyles.btnTxtCardCategory))
            ],
          ),
          Center(
            child: Text(
              '${controller.products.value.length} Items',
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

  Widget sectionLabel(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(20, 25, 20, 25),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Produk Terkait', style: AppStyles.labelSection),
              Obx(() => BtnRounded(
                    widget: controller.isGridView.value
                        ? AppSvg.gridView
                        : AppSvg.listView,
                    bgColor: AppColors.lightpurple,
                    splashColor: AppColors.purplev1,
                    onTap: controller.changeTypeView,
                  ))
            ]));
  }

  Widget listProduct(BuildContext context) {
    return ListView.separated(
        itemCount: 10,
        shrinkWrap: true,
        separatorBuilder: (BuildContext context, int index) =>
            AppStyles.vSpaceSmall,
        padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return ProductTileCard(
              productName: 'Laptop Asus Aspire Pro ${index + 1}',
              productPrice: 'Rp.5000.000',
              productImage: Image.asset(
                Assets.dummLaptop,
                fit: BoxFit.cover,
              ),
              onTapCard: () {},
              onTapBtn: () {},
              controller: controller);
        });
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
        padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
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
