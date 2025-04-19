import 'package:final_project_sanbercode/components/custom_widgets/carding.dart';
import 'package:final_project_sanbercode/config/app/app_color.dart';
import 'package:final_project_sanbercode/config/app/app_font.dart';
import 'package:final_project_sanbercode/helpers/money_format.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    this.onPressed,
    required this.url,
    required this.productPrice,
    required this.productName,
  });
  final dynamic Function()? onPressed;
  final String url;
  final int productPrice;
  final String productName;
  @override
  Widget build(BuildContext context) {
    return Carding(
      color: AppColor.white,
      borderRadius: 12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              url,
              width: double.infinity,
              height: 124,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: Icon(Icons.error),
                );
              },
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 8, top: 8, bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productName,
                      style: AppFont.nunitoSansSemiBold
                          .copyWith(color: AppColor.dark, fontSize: 14),
                    ),
                    Text(
                      formatIDRCurrency(number: productPrice),
                      style: AppFont.nunitoSansBold
                          .copyWith(color: AppColor.primary, fontSize: 12),
                    )
                  ],
                ),
                const Expanded(child: SizedBox()),
                GestureDetector(
                  onTap: onPressed ?? () {},
                  child: Container(
                    decoration: const BoxDecoration(
                      color: AppColor.primary,
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                    ),
                    margin: const EdgeInsets.only(left: 28),
                    padding: const EdgeInsets.all(6),
                    child: const Icon(Icons.visibility_rounded,
                        color: AppColor.white, size: 12),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
