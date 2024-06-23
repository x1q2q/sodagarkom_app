import 'package:flutter/material.dart';
import '../../core/styles.dart';
import '../../core/colors.dart';
import 'btn_circle.dart';
import 'app_svg.dart';

enum MenuPopup { itemOne, itemTwo }

class ProductTileCard extends StatelessWidget {
  final String productName;
  final String productPrice;
  final Widget productImage;
  final void Function() onTapCard;
  final void Function() onTapBtn;
  final controller;

  const ProductTileCard(
      {Key? key,
      required this.productName,
      required this.productPrice,
      required this.productImage,
      required this.onTapCard,
      required this.onTapBtn,
      required this.controller})
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
                    height: 100,
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(18)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                              width: 90,
                              height: 90,
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
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(color: AppColors.lightgray),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                              color: Colors.white,
                              icon: Icon(
                                Icons.more_vert,
                                color: AppColors.redv2,
                                size: 40,
                              ),
                              onSelected: (MenuPopup item) {
                                if (item.name == 'itemOne') {
                                  print('detail');
                                } else {
                                  print('+keranjang');
                                }
                              },
                              itemBuilder: (BuildContext context) =>
                                  <PopupMenuEntry<MenuPopup>>[
                                    const PopupMenuItem<MenuPopup>(
                                      value: MenuPopup.itemOne,
                                      child: Text('Detail Produk',
                                          style: AppStyles.txtDropdown),
                                    ),
                                    const PopupMenuItem<MenuPopup>(
                                      value: MenuPopup.itemTwo,
                                      child: Text('+ Keranjang',
                                          style: AppStyles.txtDropdown),
                                    ),
                                  ]),
                        ])))));
  }
}
