import 'package:final_project_sanbercode/controllers/product_controller.dart';
import 'package:get/get.dart';

class ProductBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ProductController());
    // Get.lazyPut(builder: () => ProductController());
  }
}
