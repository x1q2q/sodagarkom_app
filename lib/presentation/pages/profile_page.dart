import 'package:flutter/material.dart';
import '../../core/styles.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';
import '../../core/assets.dart';
import '../../core/colors.dart';
import '../router/app_routes.dart';
import '../widgets/widgets.dart';
import '../../extensions/string_extensions.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    final ProfileController profilController = Get.find();
    return Scaffold(
        backgroundColor: AppColors.lightgray,
        body: RefreshIndicator(
            backgroundColor: AppColors.redv2,
            color: Colors.white,
            strokeWidth: 2.0,
            onRefresh: () async {
              profilController.handleRefresh();
            },
            child: SafeArea(child: LayoutBuilder(builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: ConstrainedBox(
                      constraints: BoxConstraints(
                          minHeight: viewportConstraints.maxHeight),
                      child: GetBuilder<ProfileController>(
                          builder: (dx) => Column(children: <Widget>[
                                Container(
                                  color: Colors.white,
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 60, 20, 25),
                                  height: 300.0,
                                  alignment: Alignment.center,
                                  child: headerProfile(context, dx),
                                ),
                                listFieldUser(context, dx),
                                fieldButton(context, dx),
                              ]))));
            }))));
  }

  Widget headerProfile(BuildContext context, dynamic controller) {
    return controller.isLoading
        ? AppSkeleton.shimmerProfil
        : Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.asset(Assets.appProfileUser, height: 120),
              Text(controller.customer!.username,
                  style: AppStyles.labelSection),
              ElevatedButton.icon(
                icon: const Text('Edit Profil', style: AppStyles.btnTxtWhite),
                label: AppSvg.edit,
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
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.lightgray),
            child: !isColumn
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.only(right: 10),
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
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text(textKey, style: AppStyles.fieldLabelKey)),
                      Text(textVal,
                          style: AppStyles.fieldLabelVal,
                          textAlign: TextAlign.justify)
                    ],
                  )));
  }

  Widget listFieldUser(BuildContext context, dynamic controller) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 18),
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
        color: Colors.white,
        child: controller.isLoading
            ? AppSkeleton.shimmerListProfile
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  profilFieldCard('Email', controller.customer!.email),
                  profilFieldCard(
                      'Nama Lengkap', controller.customer!.fullName),
                  profilFieldCard('No. Telepon', controller.customer!.phone),
                  profilFieldCard('Alamat', controller.customer!.address,
                      isColumn: true),
                  profilFieldCard(
                      'Terdaftar Pada',
                      '${controller.customer!.createdAt}'
                          .toFormattedDate('EEEE, dd MMMM yyyy')),
                ],
              ));
  }

  Widget fieldButton(BuildContext context, dynamic controller) {
    final dialogLogout = AppDialogCancel(
        title: 'Konfirmasi Keluar Akun',
        contentText: 'Yakin untuk keluar akun?',
        txtConfirm: 'Yakin',
        onConfirm: () {
          controller.logout();
        });
    return Container(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        color: Colors.white,
        width: double.infinity,
        child: controller.isLoading
            ? AppSkeleton.shimmerBtn
            : SizedBox.fromSize(
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
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(
                                    child: Row(children: <Widget>[
                                  AppSvg.logout,
                                  const SizedBox(width: 10),
                                  const Text('Keluar Akun',
                                      style: AppStyles.fieldLabelKey)
                                ])),
                                const Text('versi 0.1',
                                    style: AppStyles.fieldLabelVal)
                              ],
                            ))))));
  }
}
