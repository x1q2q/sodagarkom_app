import 'package:flutter/material.dart';
import '../../core/core.dart';
import '../../core/styles.dart';
import '../../core/colors.dart';
import 'btn_cart.dart';
import 'btn_circle.dart';
import 'app_svg.dart';

class AppHeader extends StatelessWidget {
  final controller;
  const AppHeader({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(Core.appName, style: AppStyles.labelAppName),
        Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: <Widget>[
            BtnCart(
                onTap: controller.goToCarts,
                svg: AppSvg.cart,
                bgColor: AppColors.lightgray,
                splashColor: AppColors.grayv1),
            Positioned(
                child: BtnCircle(
                    widget: Center(
                        child: Text('${controller.qtyCarts.value}',
                            style: AppStyles.cartItems)),
                    bgColor: AppColors.redv3,
                    size: 25),
                top: 0,
                right: 0)
          ],
        )
      ],
    );
  }
}
