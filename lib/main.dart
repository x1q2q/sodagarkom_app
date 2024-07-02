import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'presentation/router/app_routes.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'core/core.dart';
import 'core/colors.dart';

void main() async {
  initializeDateFormatting();
  await GetStorage.init();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.white54));
    GetStorage box = GetStorage();
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
      initialRoute:
          box.hasData('customerId') ? AppRoutes.appTab : AppRoutes.login,
      getPages: AppRoutes.routes,
      defaultTransition: Transition.noTransition,
      debugShowCheckedModeBanner: false,
    );
  }
}
