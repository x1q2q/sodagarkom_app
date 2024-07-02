import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../extensions/string_extensions.dart';
import '../services/dialog_services.dart';
import '../../domain/repositories/customer_repository.dart';
import '../router/app_routes.dart';

class AuthController extends GetxController {
  final CustomerRepository _customerRepository;

  AuthController(this._customerRepository);
  var isLoggedIn = false.obs;
  bool isLoading = true;
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    isLoggedIn.value = box.hasData('customerId') ? true : false;
  }

  void login(String username, String password) async {
    if (username.isNotEmpty && password.isNotEmpty) {
      checkCredential(username, password);
    } else {
      if (username.isEmpty && password.isEmpty) {
        DialogService.toastAuth('error', 'Username & password masih kosong');
      } else if (password.isEmpty) {
        DialogService.toastAuth('error', 'Password masih kosong');
      } else {
        DialogService.toastAuth('error', 'Username masih kosong');
      }
    }
  }

  void checkCredential(String username, String password) async {
    try {
      Map<String, dynamic> data = {'username': username, 'password': password};
      Map<String, dynamic> result = await _customerRepository.loginUser(data);
      isLoggedIn.value = true;
      await box.write('customerId', int.parse(result['data']['customer_id']));
      DialogService.toastAuth('success', result['message']);
      Get.offAndToNamed(AppRoutes.appTab);
    } catch (e) {
      DialogService.toastAuth('error', '$e'.extractMessage());
    }
    isLoading = false;
  }

  void register(Map<String, dynamic> dataCredential) async {
    try {
      Map<String, dynamic> result =
          await _customerRepository.registerUser(dataCredential);
      DialogService.toastAuth('success', result['message']);
      Get.toNamed(AppRoutes.login);
    } catch (e) {
      DialogService.toastAuth('error', '$e'.extractMessage());
    }
    isLoading = false;
  }
}
