import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/styles.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';
import '../../core/assets.dart';
import '../../core/colors.dart';
import '../widgets/widgets.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const DefaultAppbar(title: 'Edit Profil'),
        backgroundColor: AppColors.lightgray,
        body: SafeArea(child: LayoutBuilder(builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
              child: ConstrainedBox(
                  constraints:
                      BoxConstraints(minHeight: viewportConstraints.maxHeight),
                  child: GetBuilder<ProfileController>(
                      builder: (dx) => Column(children: <Widget>[
                            Container(
                              color: Colors.white,
                              padding:
                                  const EdgeInsets.fromLTRB(20, 25, 20, 25),
                              height: 180.0,
                              alignment: Alignment.center,
                              child: headerProfile(context, dx),
                            ),
                            listFieldUser(context, dx),
                            fieldButton(context, dx),
                          ]))));
        })));
  }

  Widget headerProfile(BuildContext context, dynamic controller) {
    return controller.isLoading
        ? AppSkeleton.shimmerEditProfil
        : Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.asset(Assets.appProfileUser, height: 120),
            ],
          );
  }

  Widget listFieldUser(BuildContext context, dynamic controller) {
    return Container(
        margin: const EdgeInsets.only(top: 18),
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            FieldInput(
                fieldLabel: 'Username',
                txtController: controller.unameCtrlr,
                placeholder: 'kolom tidak boleh kosong'),
            FieldInput(
                fieldLabel: 'Email',
                txtController: controller.emailCtrlr,
                type: TextInputType.emailAddress,
                placeholder: 'kolom tidak boleh kosong'),
            FieldInput(
                fieldLabel: 'Password Baru',
                txtController: controller.pwdCtrlr,
                placeholder: '(tetap kosongkan jika tidak ingin diubah)',
                isObscure: true,
                type: TextInputType.visiblePassword),
            FieldInput(
                fieldLabel: 'Nama Lengkap',
                txtController: controller.fnameCtrlr,
                placeholder: 'kolom tidak boleh kosong'),
            FieldInput(
                fieldLabel: 'Nomor Telepon',
                txtController: controller.phoneCtrlr,
                placeholder: '088888888',
                type: TextInputType.phone),
            FieldInput(
              fieldLabel: 'Alamat',
              txtController: controller.addressCtrlr,
              placeholder: 'kolom tidak boleh kosong',
              lines: 3,
              type: TextInputType.streetAddress,
            ),
          ],
        ));
  }

  Widget fieldButton(BuildContext context, dynamic controller) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Center(
            child: ElevatedButton.icon(
          label: AppSvg.save,
          icon: const Text('Simpan', style: AppStyles.btnTxtWhite),
          style: AppStyles.btnElevatedRed,
          onPressed: controller.updateProfile,
        )));
  }
}
