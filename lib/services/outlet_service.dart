import 'package:final_project_sanbercode/config/app/api_url.dart';
import 'package:final_project_sanbercode/helpers/dio.dart';
import 'package:final_project_sanbercode/models/outlet_model.dart';
import 'package:final_project_sanbercode/models/product_model.dart';
import 'package:get/get.dart';

class OutletService extends GetxService {
  Future<OutletService> init() async {
    return this;
  }

  Future<List<OutletModel>> getOutlets() async {
    try {
      final response = await dio.get(ApiUrl.outletUrl);
      if (response.statusCode == 200) {
        List<OutletModel> outlet = List.from(
          response.data.map((item) => OutletModel.fromJson(item)),
        );
        return outlet;
      } else {
        throw Exception('Failed to load outlet');
      }
    } catch (e) {
      rethrow;
    }
  }
}
