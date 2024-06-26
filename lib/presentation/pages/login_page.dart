import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/colors.dart';
import '../../core/assets.dart';
import '../../core/styles.dart';
import '../widgets/app_input_field.dart';
import '../router/app_routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController unameCtrlr = TextEditingController();
    final TextEditingController pwdCtrlr = TextEditingController();

    return SafeArea(
        child: GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Scaffold(
                backgroundColor: Colors.white,
                body: LayoutBuilder(
                  builder: (context, constraints) => SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                                color: AppColors.redv2,
                                width: constraints.maxWidth,
                                height: 440,
                                padding: EdgeInsets.fromLTRB(30, 40, 30, 70),
                                child: fieldHeader()),
                            Positioned(
                              bottom: -1,
                              child: Container(
                                  height: 40,
                                  width: constraints.maxWidth,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(40),
                                      topRight: Radius.circular(40),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              fieldInput('Username', unameCtrlr,
                                  'masukkan username anda'),
                              fieldInput('Password', pwdCtrlr, '************',
                                  isObscure: true,
                                  icon: Icon(Icons.visibility)),
                              fieldFooter()
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ))));
  }

  Widget fieldHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                color: Colors.white),
            height: 65,
            width: 180,
            child: Image.asset(Assets.appLogo)),
        Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Selamat Datang Kembali!',
                  textAlign: TextAlign.left, style: AppStyles.txtWTitle),
              Text('Silahkan masuk ke akun anda',
                  textAlign: TextAlign.left, style: AppStyles.txtWDesc)
            ])
      ],
    );
  }

  Widget fieldInput(String fieldLabel, TextEditingController txtController,
      String placeholder,
      {bool isObscure = false, Icon? icon, int? lines}) {
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
              icon: icon),
          AppStyles.vSpaceSmall
        ]);
  }

  Widget fieldFooter() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox.fromSize(
              child: ElevatedButton(
            child: Text('Masuk', style: AppStyles.btnAuth),
            style: AppStyles.btnElevatedPurple,
            onPressed: () {
              Get.toNamed(AppRoutes.appTab);
            },
          )),
          AppStyles.vSpaceXSmall,
          Row(
            children: [
              const Text("Belum punya akun?",
                  style: TextStyle(
                      fontFamily: 'Poppins', color: AppColors.grayv1)),
              TextButton(
                child: const Text(
                  "Daftar di sini",
                  style: TextStyle(color: AppColors.redv2),
                ),
                onPressed: () {
                  Get.toNamed(AppRoutes.registration);
                },
              ),
            ],
          )
        ]);
  }
}
