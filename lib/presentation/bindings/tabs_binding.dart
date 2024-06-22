import 'package:get/get.dart';
import '../controllers/app_tab_controller.dart';

class TabsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AppTabController(), permanent: true);
  }
}
