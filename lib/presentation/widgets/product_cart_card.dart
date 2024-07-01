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
            child: Row(
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
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        BtnCircle(
                            widget: AppSvg.cross,
                            bgColor: AppColors.redv1,
                            splashColor: AppColors.redv2,
                            size: 30,
                            onTap: () {
                              controller.deleteCart(cartId);
                            },
                            padding: 8),
                        qtyAdjuster(context)
                      ])
                ])));
  }

  Widget qtyAdjuster(BuildContext context) {
    final TextEditingController txtController = TextEditingController();
    txtController.text = '${productQuantity.value}';
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
              size: 30,
              isOutline: true),
          SizedBox(
              width: 40,
              child: TextField(
                textAlign: TextAlign.center,
                controller: txtController,
                cursorColor: AppColors.blackv1,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 4),
                    fillColor: AppColors.lightgray,
                    filled: true,
                    hintText: '0',
                    hintStyle: AppStyles.fieldInput,
                    enabled: true,
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.lightpurple)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: AppColors.purplev1, width: 2))),
                onSubmitted: (value) {
                  if (value.isNumericOnly) {
                    controller.updateItemCart(cartId, int.parse(value));
                  }
                },
              )),
          BtnRounded(
              widget: AppSvg.addCart,
              bgColor: AppColors.purplev1,
              splashColor: AppColors.lightpurple,
              onTap: () {
                controller.incrementItemCart(cartId);
              },
              size: 30,
              isOutline: true)
        ]);
  }
}
