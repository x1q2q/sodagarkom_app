import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../router/app_routes.dart';
import '../../core/styles.dart';
import '../../core/colors.dart';

enum MenuPopup { firstItem, secondItem }

class ProductTileCard extends StatelessWidget {
  final String productId;
  final String productName;
  final String productPrice;
  final Widget productImage;
  final void Function() onTapCard;
  final dynamic controller;

  const ProductTileCard(
      {super.key,
      required this.productId,
      required this.productName,
      required this.productPrice,
      required this.productImage,
      required this.onTapCard,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
        child: Material(
            color: AppColors.lightgray,
            borderRadius: BorderRadius.circular(18),
            elevation: 0.1,
            child: InkWell(
                onTap: onTapCard,
                borderRadius: BorderRadius.circular(18),
                child: Container(
                    height: 100,
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(18)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                              width: 90,
                              height: 90,
                              clipBehavior: Clip.antiAlias,
                              padding: const EdgeInsets.all(5),
                              margin: const EdgeInsets.only(right: 5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: AppColors.grayv1),
                                  borderRadius: BorderRadius.circular(18)),
                              child: productImage),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                productName,
                                overflow: TextOverflow.ellipsis,
                                style: AppStyles.productNameTile,
                              ),
                              Text(
                                productPrice,
                                overflow: TextOverflow.ellipsis,
                                style: AppStyles.productPriceTile,
                              ),
                            ],
                          )),
                          PopupMenuButton<MenuPopup>(
                              shape: const RoundedRectangleBorder(
                                  side: BorderSide(color: AppColors.lightgray),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                              color: Colors.white,
                              icon: const Icon(
                                Icons.more_vert,
                                color: AppColors.redv2,
                                size: 40,
                              ),
                              onSelected: (MenuPopup item) {
                                if (item.name == 'firstItem') {
                                  Get.toNamed(AppRoutes.productDetail
                                      .replaceFirst(":id", productId));
                                } else {
                                  controller.addToCart(int.parse(productId));
                                }
                              },
                              itemBuilder: (BuildContext context) =>
                                  <PopupMenuEntry<MenuPopup>>[
                                    const PopupMenuItem<MenuPopup>(
                                      value: MenuPopup.firstItem,
                                      child: Text('Detail Produk',
                                          style: AppStyles.txtDropdown),
                                    ),
                                    const PopupMenuItem<MenuPopup>(
                                      value: MenuPopup.secondItem,
                                      child: Text('+ Keranjang',
                                          style: AppStyles.txtDropdown),
                                    ),
                                  ]),
                        ])))));
  }
}
