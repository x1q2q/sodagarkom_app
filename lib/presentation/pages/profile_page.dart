import 'package:flutter/material.dart';
import '../../core/styles.dart';
import 'package:get/get.dart';
import '../controllers/users_controller.dart';
import '../../core/assets.dart';
import '../../core/colors.dart';
import '../router/app_routes.dart';
import '../widgets/app_svg.dart';
import '../widgets/app_dialog_cancel.dart';

class ProfilePage extends StatelessWidget {
  final UsersController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      padding: EdgeInsets.fromLTRB(20, 60, 20, 25),
                      height: 300.0,
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
        Text('@username123123', style: AppStyles.labelSection),
        ElevatedButton(
          child: Text('Edit Profil', style: AppStyles.btnTxtWhite),
          style: AppStyles.btnElevatedRed,
          onPressed: () {
            Get.toNamed(AppRoutes.editProfile);
          },
        ),
      ],
    );
  }

  Widget profilFieldCard(String textKey, String textVal,
      {bool isColumn = false}) {
    return SizedBox.fromSize(
        child: Container(
            margin: EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.lightgray),
            child: !isColumn
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Text(textKey, style: AppStyles.fieldLabelKey)),
                      Flexible(
                          child: Text(textVal,
                              style: AppStyles.fieldLabelVal,
                              overflow: TextOverflow.ellipsis))
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text(textKey, style: AppStyles.fieldLabelKey)),
                      Text(textVal,
                          style: AppStyles.fieldLabelVal,
                          textAlign: TextAlign.justify)
                    ],
                  )));
  }

  Widget listFieldUser(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 18),
        padding: EdgeInsets.fromLTRB(20, 15, 20, 0),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            profilFieldCard('Email', 'ahonghitamsemesta@gmail.com'),
            profilFieldCard('Nama Lengkap', 'Ahong Hitam Semesta'),
            profilFieldCard('No. Telepon', '083248923432'),
            profilFieldCard('Alamat',
                'Jl. desa karangtengah, pengadegan, Kab. Purbalinga 53393 ',
                isColumn: true),
            profilFieldCard('Terdaftar Pada', '10 Juni 2024'),
          ],
        ));
  }

  Widget fieldButton(BuildContext context) {
    final dialogLogout = AppDialogCancel(
        title: 'Logout Akun',
        contentText: 'Yakin untuk logout akun?',
        txtConfirm: 'Ya, Logout',
        onConfirm: () {});
    return Container(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        color: Colors.white,
        child: SizedBox.fromSize(
            child: Material(
                color: AppColors.lightgray,
                borderRadius: BorderRadius.circular(10),
                elevation: 0.1,
                child: InkWell(
                    onTap: () {
                      Get.dialog(dialogLogout);
                    },
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                                child: Row(children: <Widget>[
                              AppSvg.logout,
                              SizedBox(width: 10),
                              Text('Keluar Akun',
                                  style: AppStyles.fieldLabelKey)
                            ])),
                            Text('versi 0.1', style: AppStyles.fieldLabelVal)
                          ],
                        ))))));
  }
}
