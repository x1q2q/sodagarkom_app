import 'package:flutter/material.dart';
import '../../core/styles.dart';
import '../../core/colors.dart';
import 'btn_circle.dart';
import 'app_svg.dart';

class ProductCard extends StatelessWidget {
  final String productName;
  final String productPrice;
  final Widget productImage;
  final void Function() onTapCard;
  final void Function() onTapBtn;

  ProductCard(
      {Key? key,
      required this.productName,
      required this.productPrice,
      required this.productImage,
      required this.onTapCard,
      required this.onTapBtn})
      : super(key: key);

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
                    padding: EdgeInsets.all(10),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(18)),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                              height: 120,
                              width: double.infinity,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(18)),
                              child: productImage),
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          productName,
                                          style: AppStyles.productNameGrid,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          productPrice,
                                          style: AppStyles.productPriceGrid,
                                          overflow: TextOverflow.ellipsis,
                                        )
                                      ],
                                    ),
                                  ),
                                  BtnCircle(
                                    widget: AppSvg.cartAdd,
                                    bgColor: AppColors.redv2,
                                    splashColor: AppColors.redv1,
                                    onTap: onTapBtn,
                                    size: 35,
                                    padding: 6,
                                  )
                                ],
                              ))
                        ])))));
  }
}
