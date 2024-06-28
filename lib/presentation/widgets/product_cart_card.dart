import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/styles.dart';
import '../../core/colors.dart';
import 'btn_circle.dart';
import 'btn_rounded.dart';
import 'app_svg.dart';

class ProductCartCard extends StatelessWidget {
  final int cartId;
  final String productName;
  RxInt productQuantity;
  final String categoryName;
  final String productPrice;
  final Widget productImage;
  final controller;

  ProductCartCard(
      {Key? key,
      required this.cartId,
      required this.productName,
      required this.productQuantity,
      required this.categoryName,
      required this.productPrice,
      required this.productImage,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
        child: Container(
            height: 100,
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: AppColors.lightgray),
            child: Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Container(
                          width: 80,
                          height: 80,
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    productName,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppStyles.trxProductName,
                                  ),
                                  Text(
                                    categoryName,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppStyles.trxProductDesc,
                                  ),
                                ]),
                            Text(
                              productPrice,
                              overflow: TextOverflow.ellipsis,
                              style: AppStyles.trxProductName,
                            ),
                          ])),
                      qtyAdjuster(context)
                    ]),
                Positioned(
                    child: BtnCircle(
                        widget: AppSvg.cross,
                        bgColor: AppColors.redv1,
                        splashColor: AppColors.redv2,
                        size: 40,
                        onTap: () {
                          controller.removeItemCart(cartId);
                        },
                        padding: 12),
                    top: -25,
                    right: -5)
              ],
            )));
  }

  Widget qtyAdjuster(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          BtnRounded(
              widget: AppSvg.decCart,
              bgColor: AppColors.purplev1,
              splashColor: AppColors.lightpurple,
              onTap: () {
                controller.decrementItemCart(cartId);
              },
              isOutline: true),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text('${productQuantity.value}',
                  style: AppStyles.trxProductName)),
          BtnRounded(
              widget: AppSvg.addCart,
              bgColor: AppColors.purplev1,
              splashColor: AppColors.lightpurple,
              onTap: () {
                controller.incrementItemCart(cartId);
              },
              isOutline: true)
        ]);
  }
}
