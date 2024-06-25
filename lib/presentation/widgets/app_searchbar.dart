import 'package:flutter/material.dart';
import '../../core/colors.dart';
import '../../core/styles.dart';
import 'app_svg.dart';

class AppSearchbar extends StatelessWidget {
  final controller;
  const AppSearchbar({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: AppColors.lightgray,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
            onTap: controller.goToSearch,
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
