
import 'package:get/get_core/src/get_main.dart';

class AuthRepository {
  // final AuthService _authService;
  // final UserService _userService;
  // final _storage = Get.find<GetStorage>();
  AuthRepository();

  // Future<UserModel> authenticateUser({
  //   required String login,
  //   required String password,
  // }) async {
  //   try {
  //     final body = AuthenticateUserBody(login: login, password: password);
  //     final response = await _authService.authenticateUser(body);
  //
  //     final user = UserModel.fromData(response.data!.user);
  //     await user.save();
  //
  //     await _storage.write(
  //       StorageConstants.tokenAuthorization,
  //       response.data!.token,
  //     );
  //
  //     return user;
  //   } catch (err) {
  //     rethrow;
  //   }
  // }

  // Future<UserModel> getUser() async {
  //   try {
  //     final response = await _userService.getUserInfo();
  //     final user = UserModel.fromData(response.data!.user);
  //     user.save();
  //     return user;
  //   } catch (err) {
  //     rethrow;
  //   }
  // }

  // Future<bool> isAuthenticated() async {
  //   try {
  //     final hasToken = _storage.hasData(StorageConstants.tokenAuthorization);
  //     final hasUser = _storage.hasData(StorageConstants.user);
  //     return hasToken && hasUser;
  //   } catch (err) {
  //     rethrow;
  //   }
  // }

  // Future<void> logoutUser() async {
  //   try {
  //     await _storage.erase();
  //   } catch (err) {
  //     rethrow;
  //   }
  // }


}