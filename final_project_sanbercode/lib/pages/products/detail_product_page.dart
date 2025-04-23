import 'package:final_project_sanbercode/components/custom_widgets/button.dart';
import 'package:final_project_sanbercode/components/custom_widgets/image.dart';
import 'package:final_project_sanbercode/components/custom_widgets/toast.dart';
import 'package:final_project_sanbercode/config/app/app_color.dart';
import 'package:final_project_sanbercode/config/app/app_font.dart';
import 'package:final_project_sanbercode/controllers/product_controller.dart';
import 'package:final_project_sanbercode/helpers/money_format.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailProductPage extends StatelessWidget {
  DetailProductPage({super.key});
  final ProductController productC = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    final productId = Get.parameters['id'];
    final product = productC.getProductById(productId!);
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColor.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_outline),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OverlayImage(
                  borderRadius: 22,
                  height: 343,
                  boxFit: BoxFit.cover,
                  width: double.infinity,
                  image: NetworkImage("${product?.productImage}"),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "${product?.productName}",
                  style: AppFont.nunitoSansBold
                      .copyWith(color: AppColor.dark, fontSize: 20),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: AppColor.yellow,
                      size: 16,
                    ),
                    Text(
                      "${product?.rating}",
                      style: AppFont.nunitoSansSemiBold
                          .copyWith(color: AppColor.dark, fontSize: 12),
                    ),
                    Text(
                      '(${product?.ratingTotals})',
                      style: AppFont.nunitoSansSemiBold
                          .copyWith(color: AppColor.grayWafer, fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Text("${product?.productDescription}",
                    style: AppFont.nunitoSansRegular
                        .copyWith(color: AppColor.dark, fontSize: 12),
                    textAlign: TextAlign.justify),
                const SizedBox(
                  height: 16,
                ),
                CustomRadioButton(
                  elevation: 0,
                  enableShape: true,
                  buttonTextStyle: ButtonTextStyle(
                      textStyle: AppFont.nunitoSansSemiBold
                          .copyWith(color: AppColor.dark, fontSize: 12)),
                  unSelectedColor: AppColor.white,
                  unSelectedBorderColor: AppColor.dark.withOpacity(0.3),
                  selectedBorderColor: AppColor.primary,
                  buttonLables: const [
                    '16 cm',
                    '20 cm',
                    '22 cm',
                    '24 cm',
                  ],
                  buttonValues: const [
                    '16 cm',
                    '20 cm',
                    '22 cm',
                    '24 cms',
                  ],
                  width: 80,
                  padding: 8,
                  spacing: 1,
                  radioButtonValue: (value) {},
                  selectedColor: AppColor.primary,
                  enableButtonWrap: false,
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    const Icon(Icons.border_color,
                        size: 16, color: AppColor.grayWafer),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(' Add wording on your cake (optional)',
                        style: AppFont.nunitoSansRegular
                            .copyWith(color: AppColor.grayWafer, fontSize: 12)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: const BoxDecoration(
          color: AppColor.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total price',
                  style: AppFont.nunitoSansRegular.copyWith(
                    fontSize: 12,
                    color: AppColor.grayWafer,
                  ),
                ),
                Text(
                  formatIDRCurrency(number: product?.productPrice ?? 0),
                  style: AppFont.nunitoSansBold.copyWith(
                    fontSize: 18,
                    color: AppColor.primary,
                  ),
                ),
              ],
            ),
            PillsButton(
                onPressed: () {
                  errorToast(
                    context,
                    text: 'Maaf, fitur belum tersedia sepenuhnya!',
                  );
                },
                fullWidthButton: false,
                text: 'Add to cart',
                fontSize: 16,
                paddingSize: 24),
          ],
        ),
      ),
    );
  }
}
