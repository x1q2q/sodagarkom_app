import 'package:flutter/material.dart';
import '../../core/styles.dart';
import '../../core/colors.dart';

enum MenuPopup { firstItem, secondItem }

class ProductTransactionCard extends StatelessWidget {
  final String productName;
  final String productPrice;
  final Widget productImage;
  final String productQty;

  const ProductTransactionCard(
      {Key? key,
      required this.productName,
      required this.productPrice,
      required this.productImage,
      required this.productQty})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
        child: Container(
            height: 70,
            width: double.infinity,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(18)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      width: 65,
                      height: 65,
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        productName,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.trxProductName,
                      ),
                      Text(
                        productPrice,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.trxProductDesc,
                      ),
                    ],
                  )),
                  Text('$productQty item', style: AppStyles.trxProductDesc),
                ])));
  }
}
