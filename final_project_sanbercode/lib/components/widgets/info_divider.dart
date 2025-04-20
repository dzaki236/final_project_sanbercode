import 'package:final_project_sanbercode/config/app/app_color.dart';
import 'package:final_project_sanbercode/config/app/app_font.dart';
import 'package:flutter/material.dart';

class InfoDivider extends StatelessWidget {
  const InfoDivider({
    super.key,
    required this.title,
    required this.value,
  });
  final String? title;
  final String? value;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title',
          style: AppFont.nunitoSansRegular
              .copyWith(color: AppColor.grayWafer, fontSize: 14),
        ),
        Text(
          '$value',
          style: AppFont.nunitoSansBold
              .copyWith(color: AppColor.dark, fontSize: 14),
        ),
        Divider(
          color: AppColor.gray.withOpacity(0.5),
          thickness: 1,
        ),
      ],
    );
  }
}
