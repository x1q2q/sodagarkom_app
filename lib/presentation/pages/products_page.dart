import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SafeArea(
                child: Column(
      children: <Widget>[
        Center(child: Text('ini product list')),
        ElevatedButton(
            onPressed: () {
              Get.toNamed('/product-detail');
            },
            child: Text('Details'))
      ],
    ))));
  }
}
