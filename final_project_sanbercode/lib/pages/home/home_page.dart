import 'package:final_project_sanbercode/components/widgets/banner_image.dart';
import 'package:final_project_sanbercode/components/widgets/outlet_image.dart';
import 'package:final_project_sanbercode/components/widgets/product_card.dart';
import 'package:final_project_sanbercode/components/widgets/stand_search_bar.dart';
import 'package:final_project_sanbercode/controllers/auth_controller.dart';
import 'package:final_project_sanbercode/controllers/outlet_controller.dart';
import 'package:final_project_sanbercode/routes/product_routes.dart';
import 'package:flutter/material.dart';
import 'package:final_project_sanbercode/config/app/app_color.dart';
import 'package:final_project_sanbercode/config/app/app_font.dart';
import 'package:get/get.dart';
import 'package:final_project_sanbercode/controllers/product_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final ProductController productController = Get.find<ProductController>();
  final OutletController outletController = Get.find<OutletController>();
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// AppBar
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hi there!',
                              style:
                                  AppFont.nunitoSansBold.copyWith(fontSize: 20),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'What are you looking for today?',
                              style: AppFont.nunitoSansRegular
                                  .copyWith(fontSize: 12),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            authController.signOut(context);
                          },
                          child: const Icon(
                            Icons.logout,
                            color: AppColor.dark,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColor.gray),
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: const StandSearchBar(
                          'Search cake, cookies, anything..'),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),

                /// EndAppBar
                const SizedBox(
                  height: 16,
                ),

                /// Banner
                SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            left: index == 0 ? 32 : 0, right: 16, top: 16),
                        child: const BannerImage('assets/images/banner.png'),
                      );
                    },
                    itemCount: 3,
                  ),
                ),

                /// EndBanner

                const SizedBox(
                  height: 24,
                ),

                /// Categories
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Our Product',
                          style: AppFont.nunitoSansBold
                              .copyWith(color: AppColor.dark, fontSize: 16),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(ProductRoutes.products);
                          },
                          child: Text(
                            'All Product',
                            style: AppFont.nunitoSansBold.copyWith(
                                color: AppColor.primary, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    GetBuilder(
                      init: productController,
                      builder: (_) {
                        if (productController.isLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return SizedBox(
                          height: 260,
                          width: double.infinity,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              physics: const AlwaysScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      right: 16, top: 16, bottom: 20),
                                  child: SingleChildScrollView(
                                    child: ProductCard(
                                      url:
                                          "${productController.products[index].productImage}",
                                      productName:
                                          "${productController.products[index].productName}-${productController.products[index].id}",
                                      productPrice: productController
                                          .products[index].productPrice,
                                      onPressed: () {
                                        Get.toNamed(
                                          "${ProductRoutes.products}/${productController.products[index].id}",
                                        );
                                      },
                                    ),
                                  ),
                                );
                              },
                              itemCount: 1), // diambil length nya..
                        );
                      },
                    ),
                  ],
                ),

                /// Outlets
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Explore Shop',
                      style: AppFont.nunitoSansBold
                          .copyWith(color: AppColor.dark, fontSize: 16),
                    ),
                    const SizedBox(height: 12),
                    GetBuilder(
                        init: outletController,
                        builder: (_) {
                          if (outletController.isLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, // number of items in each row
                              mainAxisSpacing: 12.0, // spacing between rows
                              crossAxisSpacing: 12.0, // spacing between columns
                            ),
                            itemCount: outletController
                                .outlets.length, // diambil length nya..
                            itemBuilder: (context, index) {
                              final outlet = outletController.outlets[index];
                              return OutletImage(
                                url: outlet.image ??
                                    'https://res.cloudinary.com/dgkvma38q/image/upload/v1744830956/jakarta_dszwrz.jpg',
                                text: outlet.name
                                        ?.replaceFirst('outlet-', '')
                                        .split('-')
                                        .map((word) => word.capitalize)
                                        .join(' ') ??
                                    'Outlet',
                              );
                            },
                          );
                        }),
                  ],
                ),

                /// EndOutlets
                const SizedBox(
                  height: 36,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
