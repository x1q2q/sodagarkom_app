import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/colors.dart';
import '../../core/assets.dart';
import '../../core/styles.dart';
import '../widgets/field_input.dart';
import '../router/app_routes.dart';
import '../controllers/auth_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final AuthController controller = Get.find();
  final TextEditingController unameCtrlr = TextEditingController();
  final TextEditingController pwdCtrlr = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                                padding:
                                    const EdgeInsets.fromLTRB(30, 40, 30, 70),
                                child: fieldHeader()),
                            Positioned(
                              bottom: -1,
                              child: Container(
                                  height: 40,
                                  width: constraints.maxWidth,
                                  decoration: const BoxDecoration(
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
                              FieldInput(
                                  bgColor: Colors.white,
                                  fieldLabel: 'Username',
                                  txtController: unameCtrlr,
                                  placeholder: 'masukkan username anda'),
                              FieldInput(
                                  bgColor: Colors.white,
                                  fieldLabel: 'Password',
                                  txtController: pwdCtrlr,
                                  placeholder: '************',
                                  isObscure: true,
                                  icon: const Icon(Icons.visibility)),
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
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                color: Colors.white),
            height: 65,
            width: 180,
            child: Image.asset(Assets.appLogo)),
        const Column(
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

  Widget fieldFooter() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox.fromSize(
              child: ElevatedButton(
            style: AppStyles.btnElevatedPurple,
            onPressed: () {
              controller.login(unameCtrlr.text, pwdCtrlr.text);
            },
            child: const Text('Masuk', style: AppStyles.btnAuth),
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
