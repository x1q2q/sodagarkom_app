import 'package:get/get.dart';
import '../controllers/app_tab_controller.dart';

import '../controllers/home_controller.dart';
import '../../data/network.dart';
import '../../domain/repositories/product_repository.dart';
import '../../core/core.dart';

class TabsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AppTabController(), permanent: true);
  }
}
