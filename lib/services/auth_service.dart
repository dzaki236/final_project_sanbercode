import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  static final auth = FirebaseAuth.instance;
  Future<AuthService> init() async {
    return this;
  }

  Stream<User?> get authInitialize => auth.userChanges();
}
