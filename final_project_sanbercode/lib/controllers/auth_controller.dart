import 'package:final_project_sanbercode/components/custom_widgets/toast.dart';
import 'package:final_project_sanbercode/routes/auth_routes.dart';
// import 'package:final_project_sanbercode/routes/auth_routes.dart';
import 'package:final_project_sanbercode/routes/dashboard_routes.dart';
import 'package:final_project_sanbercode/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  // final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
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
      await GoogleSignIn().disconnect();
      await GoogleSignIn().signOut();
      await successToast(context, text: 'Berhasil keluar');
      Get.offAllNamed(AuthRoutes.getStarted);
    } on FirebaseAuthException catch (_) {
      await errorToast(context, text: 'Gagal keluar');
    }
  }

  Future<void> signUp(context,
      {required String email, required String password}) async {
    try {
      // Implement your sign-up logic here
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

  Future<void> signInWithGoogle(context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return;
      }
      if (GoogleSignIn().currentUser != null) {
        await GoogleSignIn().signOut();
      }

      GoogleSignInAuthentication? googleAuth = await googleUser.authentication;
      OAuthCredential? credential = await GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await authService.signInWithCredential(credential);
      await successToast(context, text: 'Berhasil masuk dengan Google');
      Get.offAllNamed(DashboardRoutes.main);
    } on FirebaseAuthException catch (_) {
      await errorToast(context, text: 'Gagal masuk dengan Google');
    }
  }

  Future<void> resetPassword(context, {required String email}) async {
    try {
      await authService.sendPasswordResetEmail(email: email);
      await successToast(context,
          text: 'Email untuk reset password sudah dikirim');
    } on FirebaseAuthException catch (_) {
      await errorToast(context,
          text: 'Gagal mengirim email untuk reset password');
    }
  }
}
