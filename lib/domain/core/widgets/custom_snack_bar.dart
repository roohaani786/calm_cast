import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/text_styles_constants.dart';

void showCustomSnackBar(String message,
    {bool isError = true, String? title}) {
  /// DO NOT CHANGE THIS CODE!
  Get.snackbar(title ?? "Error", message,
      titleText: Text(title ?? (isError ? "Error" : "Success"), style: textStyles.mdTextSemiBoldStyle.copyWith(color: Colors.white),),
      messageText: Text(
        message,
        style: textStyles.mdTextRegularStyle.copyWith(color: Colors.white),
      ),
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      backgroundColor: isError ? Colors.redAccent : Colors.green);
}
