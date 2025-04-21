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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserInfoAvatars(email: 'test@gmail.com'),
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
                    const InfoDivider(title: 'Name', value: 'dzakiahnafz'),
                    const SizedBox(
                      height: 24,
                    ),
                    const InfoDivider(title: 'Email', value: 'test@gmail.com'),
                    const SizedBox(
                      height: 24,
                    ),
                    const InfoDivider(
                        title: 'Preferenced Id',
                        value: 'ptlM61TpBPSrvgc9Q7bvl2Ttq6x1.'),
                    const SizedBox(
                      height: 24,
                    ),
                    GFButton(
                      onPressed: () {
                        authController.signOut(context);
                      },
                      text: "Logout",
                      size: GFSize.LARGE,
                      textColor: AppColor.dark,
                      icon: const Icon(
                        Icons.logout,
                        color: AppColor.dark,
                      ),
                      color: AppColor.primary,
                      type: GFButtonType.transparent,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
