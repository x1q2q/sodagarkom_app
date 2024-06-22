import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../router/app_routes.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: <Widget>[
        Center(child: Text('ini product list')),
        ElevatedButton(
            onPressed: () {
              String productId = '1';
              Get.toNamed(
                  '${AppRoutes.productDetail.replaceFirst(":id", productId)}');
            },
            child: Text('Details'))
      ],
    )));
  }
}
