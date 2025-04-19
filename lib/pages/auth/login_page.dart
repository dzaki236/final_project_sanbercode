import 'package:final_project_sanbercode/components/custom_widgets/button.dart';
import 'package:final_project_sanbercode/components/custom_widgets/input.dart';
import 'package:final_project_sanbercode/components/custom_widgets/toast.dart';
import 'package:final_project_sanbercode/config/app/app_color.dart';
import 'package:final_project_sanbercode/config/app/app_font.dart';
import 'package:final_project_sanbercode/controllers/auth_controller.dart';
import 'package:final_project_sanbercode/pages/auth/forgot_password_page.dart';
import 'package:final_project_sanbercode/pages/auth/register_page.dart';
import 'package:final_project_sanbercode/pages/dashboard.dart';
import 'package:final_project_sanbercode/routes/dashboard_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  LoginPage({super.key});
  final AuthController authController = Get.find<AuthController>();
  dynamic _submit(context) async {
    if (_formKey.currentState!.validate()) {
      // Kalau semua valid
      debugPrint("Email: ${emailController.text}");
      debugPrint("Password: ${passwordController.text}");
      authController.signIn(
        context,
        email: emailController.text,
        password: passwordController.text,
      );
      // } else {
      // debugPrint("Form tidak valid");
      // }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Image.asset(
                  'assets/images/brand_logo.png',
                  width: 250,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Silahkan masuk melalui akun',
                  style: AppFont.nunitoSansBold
                      .copyWith(fontSize: 20, color: AppColor.dark),
                ),
                Form(
                  key: _formKey, // Penting!
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      Input(
                        labelText: 'Email',
                        hintText: 'Masukkan email',
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email wajib diisi';
                          }
                          if (!value.contains('@')) {
                            return 'Email tidak valid';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      Input(
                        labelText: 'Password',
                        hintText: 'Masukkan password',
                        controller: passwordController,
                        isPassword: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password wajib diisi';
                          }
                          if (value.length < 6) {
                            return 'Password minimal 6 karakter';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          const Expanded(
                            child: SizedBox(),
                          ),
                          GestureDetector(
                            child: const Text('Lupa Password?'),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ForgotPasswordPage(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      PillsButton(
                        text: 'Masuk',
                        fontSize: 16,
                        paddingSize: 80,
                        onPressed: () => _submit(context),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          const Expanded(
                            child: Divider(
                              color: AppColor.gray,
                              height: 3,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Text(
                              'Atau masuk menggunakan',
                              style: AppFont.nunitoSansRegular
                                  .copyWith(color: AppColor.gray),
                            ),
                          ),
                          const Expanded(
                            child: Divider(
                              color: AppColor.gray,
                              height: 3,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      IconPillsButton(
                        icon: Image.asset(
                          'assets/images/google_logo.png',
                          width: 35,
                          height: 35,
                        ),
                        size: 35,
                        buttonType: GFIconButtonShape.circle,
                        borderColor: AppColor.red,
                        borderWidth: 2,
                        color: AppColor.white,
                        onPressed: () {},
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterPage(),
                            ),
                          );
                        },
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Belum punya akun?,',
                                style: AppFont.nunitoSansRegular
                                    .copyWith(color: AppColor.dark),
                              ),
                              TextSpan(
                                text: ' Mendaftar ',
                                style: AppFont.nunitoSansRegular
                                    .copyWith(color: AppColor.primary),
                              ),
                              TextSpan(
                                text: 'Sekarang',
                                style: AppFont.nunitoSansRegular
                                    .copyWith(color: AppColor.dark),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
