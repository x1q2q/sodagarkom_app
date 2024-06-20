import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
// import '../controllers/home_controller.dart';
import '../../core/core.dart';
import '../../core/colors.dart';
import '../widgets/btn_cart.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final HomeController controller = Get.find();
    //         Obx(() => Text('Hello, ${controller.product.value.stock}'))));
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: LayoutBuilder(builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                  child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: viewportConstraints.maxHeight,
                      ),
                      child: IntrinsicHeight(
                          child: Column(children: <Widget>[
                        Container(
                          color: const Color(0xffeeee00), // Yellow
                          height: 481.0,
                          alignment: Alignment.center,
                          child: const Text('Fixed Height Content'),
                        ),
                        Expanded(
                            child: Column(
                          children: <Widget>[
                            Container(
                              color: AppColors.redv1, // Red
                              height: 120.0,
                              alignment: Alignment.center,
                              child: const Text('Flexible Content'),
                            ),
                            Container(
                              color: AppColors.redv1, // Red
                              height: 120.0,
                              alignment: Alignment.center,
                              child: const Text('Flexible Content'),
                            ),
                            Container(
                              color: AppColors.redv1, // Red
                              height: 120.0,
                              alignment: Alignment.center,
                              child: const Text('Flexible Content'),
                            )
                          ],
                        ))
                      ]))));
            })));
  }
}
