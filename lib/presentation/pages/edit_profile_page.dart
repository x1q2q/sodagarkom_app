import 'package:flutter/material.dart';
import '../../core/styles.dart';
import 'package:get/get.dart';
import '../controllers/users_controller.dart';
import '../../core/assets.dart';
import '../../core/colors.dart';
import '../router/app_routes.dart';
import '../widgets/widgets.dart';

class EditProfilePage extends StatelessWidget {
  final UsersController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DefaultAppbar(title: 'Edit Profil'),
        backgroundColor: AppColors.lightgray,
        body: SafeArea(child: LayoutBuilder(builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
              child: ConstrainedBox(
                  constraints:
                      BoxConstraints(minHeight: viewportConstraints.maxHeight),
                  child: Column(children: <Widget>[
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.fromLTRB(20, 25, 20, 25),
                      height: 180.0,
                      alignment: Alignment.center,
                      child: headerProfile(context),
                    ),
                    listFieldUser(context),
                    fieldButton(context),
                  ])));
        })));
  }

  Widget headerProfile(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Image.asset(Assets.appProfileUser, height: 120),
      ],
    );
  }

  Widget fieldInput(String fieldLabel, TextEditingController txtController,
      String placeholder,
      {bool isObscure = false, Icon? icon, int lines = 1}) {
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
          ),
          AppStyles.vSpaceSmall
        ]);
  }

  Widget listFieldUser(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 18),
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            fieldInput(
                'Username', controller.unameCtrlr, 'kolom tidak boleh kosong'),
            fieldInput(
                'Email', controller.emailCtrlr, 'kolom tidak boleh kosong'),
            fieldInput('Nama Lengkap', controller.fnameCtrlr,
                'masukkan kolom tidak boleh kosong'),
            fieldInput('Nomor Telepon', controller.notelpCtrlr,
                'kolom tidak boleh kosong'),
            fieldInput(
                'Alamat', controller.addressCtrlr, 'kolom tidak boleh kosong',
                lines: 3),
          ],
        ));
  }

  Widget fieldButton(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 30),
        child: Center(
            child: ElevatedButton.icon(
          label: AppSvg.save,
          icon: Text('Simpan', style: AppStyles.btnTxtWhite),
          style: AppStyles.btnElevatedRed,
          onPressed: () {},
        )));
  }
}
