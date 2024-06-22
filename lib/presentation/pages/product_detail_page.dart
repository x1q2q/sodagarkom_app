import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/colors.dart';
import '../widgets/default_appbar.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage();

  @override
  Widget build(BuildContext context) {
    final String productId = Get.parameters['id'] ?? 'unknown';
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: DefaultAppbar(title: 'Product detail'),
        body: SafeArea(child: Text('product details')));
  }
}
