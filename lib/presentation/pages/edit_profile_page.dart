import 'package:flutter/material.dart';
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

  Widget fieldInput(String fieldLabel, TextEditingController txtController,
      String placeholder,
      {bool isObscure = false,
      Icon? icon,
      int lines = 1,
      TextInputType type = TextInputType.name}) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            fieldLabel,
            style: AppStyles.fieldLabelKey,
          ),
          AppStyles.vSpaceXSmall,
          AppInputField(
              controller: txtController,
              hintText: placeholder,
              obscureText: isObscure,
              icon: icon,
              bgColor: AppColors.lightgray,
              lines: lines,
              type: type),
          AppStyles.vSpaceSmall
        ]);
  }

  Widget listFieldUser(BuildContext context, dynamic controller) {
    return Container(
        margin: const EdgeInsets.only(top: 18),
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            fieldInput(
                'Username', controller.unameCtrlr, 'kolom tidak boleh kosong'),
            fieldInput(
                'Email', controller.emailCtrlr, 'kolom tidak boleh kosong',
                type: TextInputType.emailAddress),
            fieldInput('Password Baru', controller.pwdCtrlr,
                '(tetap kosongkan jika tidak ingin diubah)',
                isObscure: true, type: TextInputType.visiblePassword),
            fieldInput('Nama Lengkap', controller.fnameCtrlr,
                'masukkan kolom tidak boleh kosong'),
            fieldInput('Nomor Telepon', controller.notelpCtrlr,
                'kolom tidak boleh kosong',
                type: TextInputType.phone),
            fieldInput(
                'Alamat', controller.addressCtrlr, 'kolom tidak boleh kosong',
                lines: 3, type: TextInputType.streetAddress),
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
