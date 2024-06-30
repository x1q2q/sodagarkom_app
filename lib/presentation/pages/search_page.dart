import 'package:flutter/material.dart';
import '../../core/styles.dart';
import 'package:get/get.dart';
import '../controllers/my_search_controller.dart';
import '../../core/assets.dart';
import '../../core/colors.dart';
import '../widgets/widgets.dart';
import '../router/app_routes.dart';

class SearchPage extends StatelessWidget {
  final TextEditingController txtController = TextEditingController();
  final MySearchController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 58,
          backgroundColor: AppColors.lightgray,
          elevation: 0.3,
          title: TextField(
            autofocus: true,
            controller: txtController,
            cursorColor: AppColors.blackv1,
            decoration: InputDecoration(
                isDense: true,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                border: null,
                fillColor: Colors.white,
                filled: true,
                hintText: 'Cari produk di sini ...',
                hintStyle: AppStyles.fieldInput,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide:
                        const BorderSide(width: 0, style: BorderStyle.none)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide:
                        const BorderSide(width: 0, style: BorderStyle.none))),
            onSubmitted: (value) async {
              controller.searchKeywords(value);
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
        body: SafeArea(child: LayoutBuilder(builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
              child: ConstrainedBox(
                  constraints:
                      BoxConstraints(minHeight: viewportConstraints.maxHeight),
                  child: Column(children: <Widget>[
                    Obx(() => !controller.onSubmit.value
                        ? filteredProducts()
                        : result(context))
                  ])));
        })));
  }

  Widget productHistoryCard(String name) {
    return SizedBox.fromSize(
        child: Container(
            height: 40,
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.lightgray),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Row(children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: AppSvg.timeHistory),
                  Text(name, style: AppStyles.trxProductDesc)
                ])),
                IconButton(
                    padding: EdgeInsets.all(6),
                    onPressed: () {},
                    icon: AppSvg.crossHistory)
              ],
            )));
  }

  Widget filteredProducts() {
    return ListView.separated(
        itemCount: 4,
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        separatorBuilder: (BuildContext context, int index) =>
            AppStyles.vSpaceSmall,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return productHistoryCard('produk example ${index + 1}');
        });
  }

  Widget result(BuildContext context) {
    return Column(children: <Widget>[
      sectionLabel(context),
      Obx(() => controller.isGridView.value
          ? gridProducts(context)
          : listProduct(context))
    ]);
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
              productImage: Image.asset(Assets.dummLaptop2, fit: BoxFit.cover),
              onTapCard: () {
                String productId = '1';
                Get.toNamed(
                    '${AppRoutes.productDetail.replaceFirst(":id", productId)}');
              },
              onTapBtn: () {});
        });
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
              productId: '1',
              productName: 'Laptop Asus Aspire Pro ${index + 1}',
              productPrice: 'Rp.5000.000',
              productImage: Image.asset(Assets.dummLaptop2, fit: BoxFit.cover),
              onTapCard: () {
                String productId = '1';
                Get.toNamed(
                    '${AppRoutes.productDetail.replaceFirst(":id", productId)}');
              },
              controller: controller);
        });
  }
}
