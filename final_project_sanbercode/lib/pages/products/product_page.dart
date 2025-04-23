// import 'package:final_project_sanbercode/components/widgets/outlet_image.dart';
import 'package:final_project_sanbercode/components/widgets/product_card.dart';
import 'package:final_project_sanbercode/components/widgets/stand_search_bar.dart';
import 'package:final_project_sanbercode/config/app/app_color.dart';
import 'package:final_project_sanbercode/config/app/app_font.dart';
import 'package:final_project_sanbercode/controllers/product_controller.dart';
import 'package:final_project_sanbercode/models/product_model.dart';
import 'package:final_project_sanbercode/routes/product_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductPage extends StatelessWidget {
  ProductPage({super.key});
  final ProductController productController = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      builder: (controller) {
        if (controller.categories.isEmpty) {
          return Scaffold(
            body: Center(
                child: CircularProgressIndicator(color: AppColor.primary)),
          );
        }
        return DefaultTabController(
          length: controller.categories.length,
          child: Scaffold(
            backgroundColor: AppColor.white,
            appBar: AppBar(
              scrolledUnderElevation: 0,
              elevation: 0,
              backgroundColor: AppColor.white,
              title: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.gray),
                  borderRadius: BorderRadius.circular(28),
                ),
                child: const StandSearchBar('Search cake, cookies, anything..'),
              ),
              // centerTitle: true,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(80),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Text(
                        'Categories',
                        style: AppFont.nunitoSansBold
                            .copyWith(fontSize: 20, color: AppColor.dark),
                      ),
                    ),
                    TabBar(
                      labelStyle:
                          AppFont.nunitoSansMedium.copyWith(fontSize: 14),
                      labelColor: AppColor.primary,
                      unselectedLabelColor: AppColor.dark,
                      indicatorColor: AppColor.primary,
                      isScrollable: true,
                      padding: const EdgeInsets.only(left: 0, right: 0),
                      indicatorPadding: EdgeInsets.zero,
                      labelPadding: const EdgeInsets.only(left: 25, right: 25),
                      onTap: (index) {
                        controller.changeCategory(controller.categories[index]);
                      },
                      tabs: controller.categories
                          .map((cat) => Tab(text: cat))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
            body: controller.isLoading
                ? Center(
                    child: CircularProgressIndicator(
                    color: AppColor.primary,
                  ))
                : SafeArea(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: ProductTabView(products: controller.products),
                      ),
                    ),
                  ),
          ),
        );
      },
    );
  }
}

class ProductTabView extends StatelessWidget {
  final List<ProductModel> products;

  const ProductTabView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return Center(
        child: Text("No products found."),
      );
    }
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductCard(
            url: "${product.productImage}",
            productPrice: product.productPrice,
            productName: "${product.productName}",
            onPressed: () {
              Get.toNamed(
                "${ProductRoutes.products}/${product.id}",
              );
            });
      },
      itemCount: products.length,
    );
  }
}
