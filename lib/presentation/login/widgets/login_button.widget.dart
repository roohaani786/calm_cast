import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/login.controller.dart';

class LoginButtonWidget extends GetView<LoginController> {
  const LoginButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      // onPressed: controller.enableButton ? controller.doLogin : ()=>{print("null")},
      onPressed: ()=> controller.doLogin(),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Get.theme.primaryColor),
      ),
      child: const SizedBox(
        height: 60,
        width: double.infinity,
        child: Center(
          child: Text(
            'ENTER',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
      ),
    );
  }
}