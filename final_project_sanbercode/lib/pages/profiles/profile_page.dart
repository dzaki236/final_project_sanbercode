import 'package:final_project_sanbercode/components/widgets/info_divider.dart';
import 'package:final_project_sanbercode/components/widgets/user_info_avatars.dart';
import 'package:final_project_sanbercode/config/app/app_color.dart';
import 'package:final_project_sanbercode/config/app/app_font.dart';
import 'package:final_project_sanbercode/pages/auth/login_page.dart';
import 'package:final_project_sanbercode/pages/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:final_project_sanbercode/controllers/auth_controller.dart';
import 'package:getwidget/getwidget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();
    // final user = authController.auth.currentUser;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const Dashboard(),
              ),
            );
          },
        ),
        title: Text(
          'About Me',
          style: AppFont.nunitoSansSemiBold.copyWith(
            fontSize: 14,
            color: AppColor.dark,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColor.white,
        scrolledUnderElevation: 0,
      ),
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: GetBuilder(
                init: authController,
                builder: (_) {
                  final user = authController.authService.currentUser;
                  if (user == null) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColor.primary,
                      ),
                    );
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UserInfoAvatars(email: user.email ?? 'tidak ada email'),
                      const SizedBox(
                        height: 40,
                      ),
                      Center(
                        child: Text(
                          'About Me',
                          style: AppFont.nunitoSansBold
                              .copyWith(color: AppColor.dark, fontSize: 20),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InfoDivider(
                              title: 'Name',
                              value: user.displayName ??
                                  'Nama tidak ada, harus login terlebih dahulu untuk menampilkan..'),
                          const SizedBox(
                            height: 24,
                          ),
                          InfoDivider(
                              title: 'Email',
                              value: user.email ?? 'Tidak ada email'),
                          const SizedBox(
                            height: 24,
                          ),
                          InfoDivider(title: 'Preferenced Id', value: user.uid),
                          const SizedBox(
                            height: 24,
                          ),
                          GestureDetector(
                            onTap: () {
                              authController.signOut(context);
                            },
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.logout,
                                  color: AppColor.dark,
                                ),
                                Text(
                                  'Logout',
                                  style: AppFont.nunitoSansMedium.copyWith(
                                    fontSize: 16,
                                    color: AppColor.dark,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
