import 'package:final_project_sanbercode/models/product_model.dart';
import 'package:final_project_sanbercode/services/product_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  @override
  void onInit() {
    getProductsList();
    super.onInit();
  }

  void test() {}
  List<ProductModel> products = [];
  ProductModel? product;
  bool isLoading = true;
  final ProductService productService = ProductService();
  Future<void> getProductsList() async {
    try {
      isLoading = true;
      update();
      products = await ProductService().getProducts(5);
      update();
    } catch (e) {
      // Handle error
      debugPrint('Error fetching products: $e');
    } finally {
      isLoading = false;
      update();
    }
  }

  ProductModel? getProductById(String id) {
    return products.firstWhereOrNull((item) => item.id == id);
  }
}
