import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'presentation/router/app_routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SodagarKom Apps',
      initialRoute: AppRoutes.home,
      getPages: AppRoutes.routes,
    );
  }
}
