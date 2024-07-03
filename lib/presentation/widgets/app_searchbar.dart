import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/colors.dart';
import '../../core/styles.dart';
import '../router/app_routes.dart';
import 'app_svg.dart';

class AppSearchbar extends StatelessWidget {
  const AppSearchbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: AppColors.lightgray,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
            onTap: () {
              Get.toNamed(AppRoutes.search);
            },
            borderRadius: BorderRadius.circular(20),
            child: Container(
                height: 58,
                width: double.infinity,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: AppSvg.search),
                    const Text(
                      'Cari produk di sini ...',
                      style: AppStyles.searchBarField,
                    )
                  ],
                ))));
  }
}
