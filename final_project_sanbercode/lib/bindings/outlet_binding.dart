import 'package:final_project_sanbercode/controllers/outlet_controller.dart';
import 'package:get/get.dart';

class OutletBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<OutletController>(() => OutletController());
  }
}
