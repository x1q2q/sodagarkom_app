import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'presentation/router/app_routes.dart';
import 'core/core.dart';
import 'core/colors.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.white54));
    return GetMaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: const ColorScheme.light().copyWith(
          primary: AppColors.redv2,
          secondary: AppColors.purplev1,
        ),
      ),
      title: Core.appName,
      initialRoute: AppRoutes.login,
      getPages: AppRoutes.routes,
      defaultTransition: Transition.noTransition,
      debugShowCheckedModeBanner: false,
    );
  }
}
