import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/colors.dart';
import '../../core/assets.dart';
import '../../core/styles.dart';
import '../widgets/field_input.dart';
import '../router/app_routes.dart';
import '../controllers/auth_controller.dart';

class RegistrationPage extends StatelessWidget {
  RegistrationPage({Key? key}) : super(key: key);
  final AuthController controller = Get.find();
  final TextEditingController unameCtrlr = TextEditingController();
  final TextEditingController pwdCtrlr = TextEditingController();
  final TextEditingController emailCtrlr = TextEditingController();
  final TextEditingController fnameCtrlr = TextEditingController();
  final TextEditingController phoneCtrlr = TextEditingController();
  final TextEditingController addressCtrlr = TextEditingController();

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
                                height: 270,
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
                              FieldInput(
                                  bgColor: Colors.white,
                                  fieldLabel: 'Email',
                                  txtController: emailCtrlr,
                                  placeholder: 'masukkan email anda',
                                  type: TextInputType.emailAddress),
                              FieldInput(
                                  bgColor: Colors.white,
                                  fieldLabel: 'Nama Lengkap',
                                  txtController: fnameCtrlr,
                                  placeholder: 'masukkan nama lengkap anda'),
                              FieldInput(
                                  bgColor: Colors.white,
                                  fieldLabel: 'Nomor Telepon',
                                  txtController: phoneCtrlr,
                                  placeholder: '0888888',
                                  type: TextInputType.number),
                              FieldInput(
                                  bgColor: Colors.white,
                                  fieldLabel: 'Alamat',
                                  txtController: addressCtrlr,
                                  lines: 3,
                                  placeholder: 'masukkan alamat anda',
                                  type: TextInputType.streetAddress),
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
              Text('Selamat Datang!',
                  textAlign: TextAlign.left, style: AppStyles.txtWTitle),
              Text('Silahkan daftarkan akun anda di sini',
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
              Map<String, dynamic> field = {
                'username': unameCtrlr.text,
                'password': pwdCtrlr.text,
                'email': emailCtrlr.text,
                'full_name': fnameCtrlr.text,
                'phone': phoneCtrlr.text,
                'address': addressCtrlr.text
              };
              controller.register(field);
            },
            child: const Text('Daftar', style: AppStyles.btnAuth),
          )),
          AppStyles.vSpaceXSmall,
          Row(
            children: [
              const Text("Sudah punya akun?",
                  style: TextStyle(
                      fontFamily: 'Poppins', color: AppColors.grayv1)),
              TextButton(
                child: const Text(
                  "Login di sini",
                  style: TextStyle(color: AppColors.redv2),
                ),
                onPressed: () {
                  Get.toNamed(AppRoutes.login);
                },
              ),
            ],
          )
        ]);
  }
}
