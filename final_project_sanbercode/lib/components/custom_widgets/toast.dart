import 'package:final_project_sanbercode/config/app/app_color.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

Future<void> errorToast(buildContext, {required String text}) async {
  await GFToast.showToast(
    toastDuration: 5,
    text,
    buildContext,
    backgroundColor: AppColor.red,
    toastPosition: GFToastPosition.BOTTOM,
    trailing: const Icon(
      Icons.close,
      color: AppColor.white,
    ),
  );
}

Future<void> successToast(buildContext, {required String text}) async {
  await GFToast.showToast(
    toastDuration: 5,
    text,
    buildContext,
    backgroundColor: const Color(0xFF4CAF50),
    toastPosition: GFToastPosition.BOTTOM,
    trailing: const Icon(
      Icons.close,
      color: AppColor.white,
    ),
  );
}
