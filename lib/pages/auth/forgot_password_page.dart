import 'package:final_project_sanbercode/components/custom_widgets/button.dart';
import 'package:final_project_sanbercode/components/custom_widgets/input.dart';
import 'package:final_project_sanbercode/components/custom_widgets/toast.dart';
import 'package:final_project_sanbercode/config/app/app_color.dart';
import 'package:final_project_sanbercode/config/app/app_font.dart';
import 'package:final_project_sanbercode/controllers/auth_controller.dart';
import 'package:final_project_sanbercode/pages/auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  // final AuthController authController = AuthController.to;
  final AuthController authController = Get.find<AuthController>();
  ForgotPasswordPage({super.key});
  Future<dynamic> _submit(context) async {
    if (_formKey.currentState!.validate()) {
      // Kalau semua valid
      debugPrint("Email: ${emailController.text}");
      debugPrint("Password: ${emailController.text}");
      authController.resetPassword(context, email: emailController.text);
    } else {
      debugPrint("Form tidak valid");
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
                  'Lupa Password',
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
                      const SizedBox(height: 25),
                      PillsButton(
                        text: 'Kirim Email',
                        fontSize: 16,
                        paddingSize: 80,
                        onPressed: () => _submit(context),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                            (route) => false,
                          );
                        },
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Sudah ingat?,',
                                style: AppFont.nunitoSansRegular
                                    .copyWith(color: AppColor.dark),
                              ),
                              TextSpan(
                                text: ' Kembali ',
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
