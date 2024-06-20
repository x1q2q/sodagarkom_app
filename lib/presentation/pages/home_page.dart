import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../../core/core.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();

    return Scaffold(
        appBar: AppBar(title: Text(Core.appName)),
        body: Center(
            child:
                Obx(() => Text('Hello, ${controller.product.value.stock}'))));
  }
}
