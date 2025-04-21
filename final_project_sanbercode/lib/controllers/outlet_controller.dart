import 'package:final_project_sanbercode/models/outlet_model.dart';
import 'package:final_project_sanbercode/services/outlet_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OutletController extends GetxController {
  @override
  void onInit() {
    getOutletList();
    super.onInit();
  }

  List<OutletModel> outlets = [];
  bool isLoading = true;
  Future<void> getOutletList() async {
    try {
      isLoading = true;
      update();
      outlets = await OutletService().getOutlets();
      update();
    } catch (e) {
      // Handle error
      debugPrint('Error fetching products: $e');
    } finally {
      isLoading = false;
      update();
    }
  }
}
