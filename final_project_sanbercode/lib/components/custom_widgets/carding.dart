import 'package:final_project_sanbercode/config/app/app_color.dart';
import 'package:flutter/material.dart';

class Carding extends StatelessWidget {
  const Carding({super.key, this.child, this.color, this.borderRadius = 12});

  /// [Carding] is a widget that creates a card with a specific width and color.
  final Widget? child;
  final Color? color;
  final double? borderRadius;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 12),
        ),
        color: color ?? AppColor.white,
        child: child,
      ),
    );
  }
}
