import 'package:get/get.dart';

import '../../../../presentation/login/controllers/login.controller.dart';
import '../domains/auth.repository.binding.dart';

class LoginControllerBinding extends Bindings {
  @override
  void dependencies() {
    final authRepositoryBinding = AuthRepositoryBinding();

    Get.lazyPut<LoginController>(
          () => LoginController(authRepository: authRepositoryBinding.repository),
    );
  }
}