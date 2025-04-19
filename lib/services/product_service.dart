import 'package:final_project_sanbercode/config/app/api_url.dart';
import 'package:final_project_sanbercode/helpers/dio.dart';
import 'package:final_project_sanbercode/models/product_model.dart';
import 'package:get/get.dart';

class ProductService extends GetxService {
  Future<ProductService> init() async {
    return this;
  }

  Future<List<ProductModel>> getProducts(int? limit) async {
    try {
      final response = await dio.get(ApiUrl.productUrl);
      if (response.statusCode == 200) {
        List<ProductModel> products = List.from(
          response.data.map((item) => ProductModel.fromJson(item)),
        );
        // Filter products based on the limit
        products = (limit != null) ? products.sublist(0, limit) : products;
        return products;
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<ProductModel> getProductDetail(String? id) async {
    try {
      final response = await dio.get("${ApiUrl.productUrl}/$id");
      if (response.statusCode == 200) {
        ProductModel product = ProductModel.fromJson(response.data);
        print(product);
        // Filter products based on the limit
        return product;
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      rethrow;
    }
  }
}
