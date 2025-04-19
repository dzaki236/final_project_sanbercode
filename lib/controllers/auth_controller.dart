import 'package:final_project_sanbercode/components/custom_widgets/toast.dart';
import 'package:final_project_sanbercode/routes/auth_routes.dart';
import 'package:final_project_sanbercode/routes/dashboard_routes.dart';
import 'package:final_project_sanbercode/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // signIn(email: '', password: '');
  }

  final authService = AuthService.auth;
  Future<void> signIn(context,
      {required String email, required String password}) async {
    try {
      await authService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await successToast(context, text: 'Berhasil masuk');
      Get.offAllNamed(DashboardRoutes.main);
    } on FirebaseAuthException catch (_) {
      await errorToast(context, text: 'Email atau password salah');
    }
  }

  Future<void> signOut(context) async {
    // Implement your sign-out logic here
    try {
      await authService.signOut();
      await successToast(context,
          text: 'Berhasil keluar, Silahkan tunggu beberapa saat');
      Get.offAllNamed(AuthRoutes.login);
    } on FirebaseAuthException catch (_) {
      await errorToast(context, text: 'Gagal keluar');
    }
  }

  Future<void> signUp(context,
      {required String email, required String password}) async {
    // Implement your sign-up logic here
    try {
      // login & register
      await authService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await authService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      Get.offAllNamed(DashboardRoutes.main);
    } on FirebaseAuthException catch (_) {
      await errorToast(context, text: 'Gagal mendaftar');
    }
  }
}
