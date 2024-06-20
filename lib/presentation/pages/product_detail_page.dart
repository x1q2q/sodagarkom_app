import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage();

  @override
  Widget build(BuildContext context) {
    final String productId = Get.parameters['id'] ?? 'unknown';
    return Scaffold(
        appBar: AppBar(title: Text('product detail $productId')),
        body: Text('product details'));
  }
}
