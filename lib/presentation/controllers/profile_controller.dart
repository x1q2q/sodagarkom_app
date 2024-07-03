import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../domain/repositories/customer_repository.dart';
import '../../domain/models/customer.dart';
import 'package:flutter/material.dart';
import '../router/app_routes.dart';
import '../../presentation/services/toast_service.dart';
import '../../extensions/string_extensions.dart';
import 'app_tab_controller.dart';

// used for [profile_page, edit_profile_page]
class ProfileController extends GetxController {
  final CustomerRepository _userRepository;
  ProfileController(this._userRepository);

  final TextEditingController unameCtrlr = TextEditingController();
  final TextEditingController emailCtrlr = TextEditingController();
  final TextEditingController pwdCtrlr = TextEditingController();
  final TextEditingController fnameCtrlr = TextEditingController();
  final TextEditingController phoneCtrlr = TextEditingController();
  final TextEditingController addressCtrlr = TextEditingController();
  final box = GetStorage();

  final AppTabController tabCtrl = Get.find();
  bool isLoading = true;
  bool isLoadingProcess = false;
  Customer? customer;

  @override
  void onInit() {
    super.onInit();
    handleRefresh();
  }

  Future<void> handleRefresh() async {
    int customerId = await box.read('customerId');
    isLoading = true;
    update();
    fetchCustomer('$customerId');
  }

  void fetchCustomer(String customerId) async {
    try {
      Customer fetchedUser = await _userRepository.getUserByID(customerId);
      customer = fetchedUser;
      isLoading = false;
      initField();
    } catch (e) {
      print('failed to fetch customer id: $e');
    }
    update();
  }

  void initField() {
    unameCtrlr.text = customer!.username;
    emailCtrlr.text = customer!.email;
    fnameCtrlr.text = customer!.fullName ?? '';
    phoneCtrlr.text = customer!.phone;
    addressCtrlr.text = customer!.address;
  }

  void updateProfile() async {
    isLoadingProcess = true;
    try {
      String customerId = '${customer!.id}';
      Map<String, dynamic> dataField = {
        'id': customerId,
        'username': unameCtrlr.text,
        'email': emailCtrlr.text,
        'full_name': fnameCtrlr.text,
        'phone': phoneCtrlr.text,
        'address': addressCtrlr.text,
        'password': pwdCtrlr.text,
        'created_at': customer!.createdAt
      };
      final data = Customer.fromJson(dataField);
      Map<String, dynamic> result = await _userRepository.updateUser(data);
      isLoadingProcess = false;
      customer = data;
      pwdCtrlr.text = '';
      update();
      ToastService.showToast('success', result['message']);
      Get.until((route) => route.settings.name == AppRoutes.appTab);
    } catch (e) {
      initField();
      update();
      ToastService.showToast('error', '$e'.extractMessage());
    }
  }

  void logout() async {
    await box.erase();
    tabCtrl.selectedIndex.value = 0;
    Get.offNamedUntil(AppRoutes.login, (route) => false);
  }
}
