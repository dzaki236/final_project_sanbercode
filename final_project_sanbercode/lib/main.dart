// import 'package:final_project_sanbercode/pages/get_started/get_started_page.dart';
import 'package:final_project_sanbercode/config/app/app_color.dart';
import 'package:final_project_sanbercode/routes/app_routes.dart';
import 'package:final_project_sanbercode/routes/auth_routes.dart';
import 'package:final_project_sanbercode/routes/dashboard_routes.dart';
import 'package:final_project_sanbercode/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: AuthService.authInitialize(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColor.primary,
              ),
            );
          }

          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Cake Shop',
            theme: ThemeData(useMaterial3: true),
            getPages: AppRoutes.routes,
            initialRoute: snapshot.data != null
                ? DashboardRoutes.main
                : AuthRoutes.getStarted,
          );
        });
  }
}
