import 'package:final_project_sanbercode/components/custom_widgets/image.dart';
import 'package:flutter/material.dart';

class BannerImage extends StatelessWidget {
  const BannerImage(
    this.url, {
    super.key,
  });
  final String url;
  @override
  Widget build(BuildContext context) {
    return OverlayImage(
      width: 320,
      height: 100,
      boxFit: BoxFit.cover,
      borderRadius: 12,
      image: AssetImage(url),
    );
  }
}
