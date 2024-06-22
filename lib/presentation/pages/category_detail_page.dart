import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sodagarkom_app/core/styles.dart';
import 'package:sodagarkom_app/presentation/widgets/btn_circle.dart';
import '../controllers/category_detail_controller.dart';
import '../widgets/default_appbar.dart';
import '../../core/colors.dart';
import '../widgets/product_tile_card.dart';
import '../../core/assets.dart';

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
                    Padding(
                        padding: EdgeInsets.fromLTRB(20, 25, 20, 25),
                        child: Column(
                          children: <Widget>[
                            sectionFiltered(context),
                            AppStyles.vSpaceSmall,
                          ],
                        )),
                    listProduct(context)
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

  Widget sectionFiltered(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Produk Terkait', style: AppStyles.labelSection),
          BtnCircle(
              widget: Icon(
                Icons.grid_on,
                color: Colors.white,
              ),
              bgColor: AppColors.lightpurple,
              size: 35)
        ]);
  }

  Widget listProduct(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return ProductTileCard(
              productName: 'Laptop1',
              productPrice: 'Rp.5000.000',
              productImage: Image.asset(
                Assets.dummLaptop,
              ),
              onTapCard: () {},
              onTapBtn: () {});
        });
  }
}
