import 'package:get/get.dart';

import '../../../../domain/auth/auth.repository.dart';
import '../../../connect.dart';

class AuthRepositoryBinding {
  late AuthRepository _authRepository;
  AuthRepository get repository => _authRepository;

  AuthRepositoryBinding() {
    final getConnect = Get.find<GetConnect>();
    final connect = Connect(connect: getConnect);
    // final authService = AuthService(connect);
    // final userService = UserService(connect);
    _authRepository = AuthRepository(
      // authService: authService,
      // userService: userService,
    );
  }
}