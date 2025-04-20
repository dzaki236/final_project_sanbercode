import 'package:final_project_sanbercode/bindings/auth_binding.dart';
import 'package:final_project_sanbercode/bindings/outlet_binding.dart';
import 'package:final_project_sanbercode/bindings/product_binding.dart';
import 'package:final_project_sanbercode/pages/auth/forgot_password_page.dart';
import 'package:final_project_sanbercode/pages/auth/login_page.dart';
import 'package:final_project_sanbercode/pages/auth/register_page.dart';
import 'package:final_project_sanbercode/pages/dashboard.dart';
import 'package:final_project_sanbercode/pages/get_started/get_started_page.dart';
import 'package:final_project_sanbercode/pages/products/detail_product_page.dart';
import 'package:final_project_sanbercode/pages/products/product_page.dart';
import 'package:final_project_sanbercode/routes/auth_routes.dart';
import 'package:final_project_sanbercode/routes/product_routes.dart';
import 'package:final_project_sanbercode/routes/dashboard_routes.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: AuthRoutes.getStarted, page: () => const GetStartedPage()),
    GetPage(
      name: AuthRoutes.login,
      page: () => LoginPage(),
      bindings: [
        AuthBinding(),
      ],
    ),
    GetPage(
      name: AuthRoutes.register,
      page: () => RegisterPage(),
      bindings: [
        AuthBinding(),
      ],
    ),
    GetPage(
      name: AuthRoutes.forgotPassword,
      page: () => ForgotPasswordPage(),
      bindings: [
        AuthBinding(),
      ],
    ),
    GetPage(
      name: DashboardRoutes.main,
      page: () => Dashboard(),
      bindings: [
        ProductBinding(),
        AuthBinding(),
        OutletBinding(),
      ],
    ),
    GetPage(name: ProductRoutes.products, page: () => ProductPage()),
    GetPage(
      name: ProductRoutes.detail,
      page: () => DetailProductPage(),
      bindings: [
        ProductBinding(),
      ],
    ),
    GetPage(
      name: ProductRoutes.products,
      page: () => ProductPage(),
      bindings: [
        ProductBinding(),
      ],
    ),
  ];
}
