import 'package:final_project_sanbercode/components/custom_widgets/button.dart';
import 'package:final_project_sanbercode/components/custom_widgets/input.dart';
import 'package:final_project_sanbercode/components/custom_widgets/toast.dart';
import 'package:final_project_sanbercode/config/app/app_color.dart';
import 'package:final_project_sanbercode/config/app/app_font.dart';
import 'package:final_project_sanbercode/controllers/auth_controller.dart';
import 'package:final_project_sanbercode/pages/auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

class RegisterPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();
  final AuthController authController = Get.find<AuthController>();
  RegisterPage({super.key});
  dynamic _submit(context) async {
    if (_formKey.currentState!.validate()) {
      // Kalau semua valid
      debugPrint("Email: ${emailController.text}");
      debugPrint("Password: ${passwordController.text}");
      authController.signUp(
        context,
        email: emailController.text,
        password: passwordController.text,
      );
      await successToast(context,
          text: 'Berhasil mendaftar, Silahkan tunggu beberapa saat');
    } else {
      debugPrint("Form tidak valid");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColor.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: AppColor.dark,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: AppColor.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: SafeArea(
          child: SingleChildScrollView(
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
                  'Silahkan daftar melalui akun',
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
                        keyboardType: TextInputType.emailAddress,
                        labelText: 'Email',
                        hintText: 'Masukkan email',
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email wajib diisi';
                          }
                          if (!value.contains('@')) {
                            return 'Email tidak valid';
                          }
                          if (!value.contains('.')) {
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
                      const SizedBox(height: 20),
                      Input(
                        labelText: 'Konfirmasi Password',
                        hintText: 'Masukkan Konfirmasi password',
                        controller: passwordConfirmationController,
                        isPassword: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Konfirmasi password wajib diisi';
                          }
                          if (passwordConfirmationController.text !=
                              passwordController.text) {
                            return 'Konfirmasi password tidak sesuai';
                          }
                          if (value.length < 6) {
                            return 'Konfirmasi password minimal 6 karakter';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),
                      PillsButton(
                        text: 'Mendaftar',
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
                              'Atau daftar menggunakan',
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
                        onPressed: () {
                          authController.signInWithGoogle(context);
                        },
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        },
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Sudah punya akun?, Silahkan',
                                style: AppFont.nunitoSansRegular
                                    .copyWith(color: AppColor.dark),
                              ),
                              TextSpan(
                                text: ' Masuk ',
                                style: AppFont.nunitoSansRegular
                                    .copyWith(color: AppColor.primary),
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
