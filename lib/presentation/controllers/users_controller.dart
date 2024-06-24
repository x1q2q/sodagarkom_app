import 'package:get/get.dart';
import '../../domain/repositories/user_repository.dart';
import '../../domain/models/user.dart';
import 'package:flutter/material.dart';

// used for [profile_page, edit_profile_page]
class UsersController extends GetxController {
  final UserRepository _userRepository;
  UsersController(this._userRepository);

  final TextEditingController unameCtrlr = TextEditingController();
  final TextEditingController emailCtrlr = TextEditingController();
  final TextEditingController fnameCtrlr = TextEditingController();
  final TextEditingController notelpCtrlr = TextEditingController();
  final TextEditingController addressCtrlr = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    initField();
  }

  var user = User(
          id: 0,
          username: 'lading',
          email: 'loading',
          fullName: 'loading',
          noTelepon: 'loading',
          address: 'loading',
          createdAt: 'loading')
      .obs;

  void initField() {
    unameCtrlr.text = '@username12831';
    emailCtrlr.text = 'ahonghitamsemesta@gmail.com';
    fnameCtrlr.text = 'Ahong Hitam Semesta';
    notelpCtrlr.text = '083248923432';
    addressCtrlr.text =
        'Jl. desa karangtengah, pengadegan, Kab. Purbalinga 53393 ';
  }
}
