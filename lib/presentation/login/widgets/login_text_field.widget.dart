import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/login.controller.dart';

class LoginTextFieldWidget extends GetView<LoginController> {
  const LoginTextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => TextFormField(
        onChanged: controller.login,
        textAlign: TextAlign.center,
        focusNode: controller.loginFocus,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (_) {
          controller.passwordFocus.requestFocus();
        },
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          errorText: controller.loginError.value,
          hintText: 'Login',
          hintStyle: Get.textTheme.headline6?.copyWith(color: Colors.black54),
        ),
      ),
    );
  }
}