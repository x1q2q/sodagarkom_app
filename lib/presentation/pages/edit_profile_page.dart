import 'dart:ffi';

import 'package:flutter/material.dart';
import '../../core/styles.dart';
import 'package:get/get.dart';
import '../controllers/users_controller.dart';
import '../../core/assets.dart';
import '../../core/colors.dart';
import '../router/app_routes.dart';
import '../widgets/app_svg.dart';
import '../widgets/default_appbar.dart';

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

  Widget profilFieldCard(String textKey, final controller,
      {bool isTextArea = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: Text(textKey, style: AppStyles.fieldLabelKey)),
        SizedBox(
          child: TextFormField(
            maxLines: isTextArea ? 4 : 1,
            controller: controller,
            decoration: InputDecoration(
                isDense: true,
                labelStyle: AppStyles.fieldLabelVal,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                fillColor: AppColors.lightgray,
                filled: true,
                hintText: 'field is required',
                hintStyle: TextStyle(
                    color: AppColors.grayv1, fontWeight: FontWeight.normal),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.blackv1),
                    borderRadius: BorderRadius.circular(8)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.blackv1),
                    borderRadius: BorderRadius.circular(8))),
          ),
        ),
        AppStyles.vSpaceSmall
      ],
    );
  }

  Widget listFieldUser(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 18),
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            profilFieldCard('Username', controller.unameCtrlr),
            profilFieldCard('Email', controller.emailCtrlr),
            profilFieldCard('Nama Lengkap', controller.fnameCtrlr),
            profilFieldCard('No. Telepon', controller.notelpCtrlr),
            profilFieldCard('Alamat', controller.addressCtrlr,
                isTextArea: true),
          ],
        ));
  }

  Widget fieldButton(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 30),
        child: Center(
            child: ElevatedButton(
          child: Text('Simpan', style: AppStyles.btnTxtWhite),
          style: AppStyles.btnElevatedRed,
          onPressed: () {},
        )));
  }
}
