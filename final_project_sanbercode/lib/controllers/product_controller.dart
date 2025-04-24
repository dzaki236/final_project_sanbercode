import 'package:final_project_sanbercode/models/product_model.dart';
import 'package:final_project_sanbercode/services/product_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  @override
  void onInit() {
    getProductsList();
    getProductByCategory();
    super.onInit();
  }

  List<ProductModel> products = [];
  ProductModel? product;
  bool isLoading = true;
  final ProductService productService = ProductService();
  var categories = ['Cake', 'Bread', 'Beverage', 'Cookies'];
  Map<String, String> categoryMap = {
    'Beverage': 'Beverage',
    'Bread': 'Bread',
    'Cake': 'Cake',
    'Cookies': 'Cookies',
  };
  var selectedCategory = 'Beverage';
  Future<void> getProductsList() async {
    try {
      isLoading = true;
      update();
      products = [];
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

  void changeCategory(String category) {
    selectedCategory = categoryMap[category] ?? category;
    getProductByCategory();
    update(); // WAJIB! Biar GetBuilder ngerender ulang
  }

  Future<void> getProductByCategory() async {
    try {
      isLoading = true;
      products = [];
      update();
      products =
          await ProductService().getProductsByCategories(selectedCategory);
      update();
      isLoading = false;
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
