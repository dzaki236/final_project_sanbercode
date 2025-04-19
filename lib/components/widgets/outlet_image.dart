import 'package:final_project_sanbercode/components/custom_widgets/image.dart';
import 'package:final_project_sanbercode/config/app/app_color.dart';
import 'package:final_project_sanbercode/config/app/app_font.dart';
import 'package:flutter/material.dart';

class OutletImage extends StatelessWidget {
  const OutletImage(
      {super.key, required this.url, this.text = '', this.colorFilter = 0.5});
  final String url;
  final String text;
  final double? colorFilter;
  @override
  Widget build(BuildContext context) {
    return OverlayImage(
      height: 300,
      width: 300,
      borderRadius: 12,
      widget: Center(
        child: Text(
          text,
          style: AppFont.nunitoSansBold.copyWith(
            color: AppColor.white,
            fontSize: 16,
          ),
        ),
      ),
      image: NetworkImage(url, scale: 1.0),
      colorFilter: colorFilter ?? 0.5,
    );
  }
}
