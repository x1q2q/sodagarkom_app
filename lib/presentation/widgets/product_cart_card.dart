import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/styles.dart';
import '../../core/colors.dart';
import 'btn_circle.dart';
import 'btn_rounded.dart';
import 'app_svg.dart';

class ProductCartCard extends StatelessWidget {
  final String productName;
  final String categoryName;
  final String productPrice;
  final Widget productImage;
  final void Function() onTapBtn;
  final controller;

  const ProductCartCard(
      {Key? key,
      required this.productName,
      required this.categoryName,
      required this.productPrice,
      required this.productImage,
      required this.onTapBtn,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
        child: Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.all(10),
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
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.only(right: 5),
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
                              'Rp. ${productPrice}',
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
                          print('removed');
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
              onTap: controller.decrementItemCart,
              isOutline: true),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Obx(() => Text('${controller.itemQty}',
                  style: AppStyles.trxProductName))),
          BtnRounded(
              widget: AppSvg.addCart,
              bgColor: AppColors.purplev1,
              splashColor: AppColors.lightpurple,
              onTap: controller.incrementItemCart,
              isOutline: true)
        ]);
  }
}
