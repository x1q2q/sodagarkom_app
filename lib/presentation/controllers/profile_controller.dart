import 'package:get/get.dart';
import '../../domain/repositories/customer_repository.dart';
import '../../domain/models/customer.dart';
import 'package:flutter/material.dart';

// used for [profile_page, edit_profile_page]
class ProfileController extends GetxController {
  final CustomerRepository _userRepository;
  ProfileController(this._userRepository);

  final TextEditingController unameCtrlr = TextEditingController();
  final TextEditingController emailCtrlr = TextEditingController();
  final TextEditingController fnameCtrlr = TextEditingController();
  final TextEditingController notelpCtrlr = TextEditingController();
  final TextEditingController addressCtrlr = TextEditingController();

  bool isLoading = true;
  Customer? customer;

  @override
  void onInit() {
    super.onInit();
    fetchCustomer('9');
  }

  void fetchCustomer(String customerId) async {
    try {
      Customer fetchedUser = await _userRepository.getUserByID(customerId);
      isLoading = false;
      customer = fetchedUser;
      initField();
    } catch (e) {
      print('failed to fetch customer id: $e');
    }
    update();
  }

  void initField() {
    unameCtrlr.text = customer!.username;
    emailCtrlr.text = customer!.email;
    fnameCtrlr.text = customer!.fullName;
    notelpCtrlr.text = customer!.phone;
    addressCtrlr.text = customer!.address;
  }
}
