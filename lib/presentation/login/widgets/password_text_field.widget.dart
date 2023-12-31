import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/login.controller.dart';

class PasswordTextFieldWidget extends GetView<LoginController> {
  const PasswordTextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => TextFormField(
        onChanged: controller.password,
        textAlign: TextAlign.center,
        obscureText: true,
        textInputAction: TextInputAction.done,
        onFieldSubmitted: (_) => controller.doLogin(),
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          errorText: controller.passwordError.value,
          hintText: 'Password',
          hintStyle: Get.textTheme.titleLarge?.copyWith(color: Colors.black54),
        ),
      ),
    );
  }
}