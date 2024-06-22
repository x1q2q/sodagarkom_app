import 'package:flutter/material.dart';
import '../../core/styles.dart';
import '../../core/colors.dart';
import 'btn_circle.dart';
import 'app_svg.dart';

class ProductTileCard extends StatelessWidget {
  final String productName;
  final String productPrice;
  final Widget productImage;
  final void Function() onTapCard;
  final void Function() onTapBtn;
  const ProductTileCard(
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
                splashColor: AppColors.grayv1,
                onTap: onTapCard,
                borderRadius: BorderRadius.circular(18),
                child: Container(
                    height: 120,
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(18)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                              width: 120,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: AppColors.grayv1,
                                  borderRadius: BorderRadius.circular(18)),
                              child: productImage),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                  child: Text(
                                productName,
                                overflow: TextOverflow.ellipsis,
                                style: AppStyles.productNameTile,
                              )),
                              Expanded(
                                  child: Text(
                                productPrice,
                                overflow: TextOverflow.ellipsis,
                                style: AppStyles.productPriceTile,
                              )),
                            ],
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.more_vert,
                                color: AppColors.blackv2,
                              ))
                        ])))));
  }
}
