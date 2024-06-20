import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'presentation/router/app_routes.dart';
import 'presentation/bindings/tabs_binding.dart';
import 'core/core.dart';
import 'core/colors.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: const ColorScheme.light().copyWith(
          primary: AppColors.redv3,
          secondary: AppColors.purplev1,
        ),
      ),
      title: Core.appName,
      initialRoute: AppRoutes.appTab,
      initialBinding: TabsBinding(),
      getPages: AppRoutes.routes,
      defaultTransition: Transition.fade,
      debugShowCheckedModeBanner: false,
    );
  }
}
