import 'dart:async';
import 'package:calm_cast/domain/core/prefs/preferences_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/logger.dart';

class AppPreferences {
  final tag = "AppPreferences";


  static AppPreferences instance = AppPreferences();
  static SharedPreferences? _sharedPreferences;

  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
  }

  Future<bool?> clear() async {
    return await _sharedPreferences?.clear();
  }

  Future<bool> _saveString(String key, String? value) {
    return _sharedPreferences!.setString(key, value ?? "");
  }

  Future<bool> _saveStringList(String key, List<String>? value) {
    return _sharedPreferences!.setStringList(key, value ?? []);
  }

  String _getString(String key, {String defaultValue = ""}) {
    String? value;
    try {
      value = _sharedPreferences!.getString(key);
    } catch (e) {
      Logger.e(tag, error: e);
    }
    if (value == null) {
      return defaultValue;
    }
    return value;
  }

  List<String> _getStringListUnEncrypted(String key,
      {List<String> defaultValue = const []}) {
    List<String>? value;
    try {
      value = _sharedPreferences!.getStringList(key);
    } catch (e) {
      Logger.e(tag, error: e);
    }
    if (value == null) {
      return defaultValue;
    }
    return value;
  }

  Future<bool> _saveInt(String key, int value) {
    return _saveString(key, value.toString());
  }

  int _getInt(String key, {int defaultValue = 0}) {
    final str = _getString(key, defaultValue: defaultValue.toString());
    final value = int.tryParse(str);
    if (value != null) {
      return value;
    }
    return defaultValue;
  }

  Future<bool> _saveBoolean(String key, bool value) {
    return _saveInt(key, value ? 1 : 0);
  }

  bool _getBoolean(String key, {bool defaultValue = false}) {
    return _getInt(key, defaultValue: defaultValue ? 1 : 0) == 1;
  }

  ///************************************************************************************************************///
  ///********************************////* Write App Specific methods here *////********************************///
  ///************************************************************************************************************///

  bool get isFirstTimeInstalled =>
      _getBoolean(PreferencesConstants.isFirstTimeInstalled,
          defaultValue: false);

  Future<bool> setLogInStatus(bool value) {
    return _saveBoolean(PreferencesConstants.isLoggedIn, value);
  }

  Future<bool> setLogInMPINFirstTimeStatus(bool value) {
    return _saveBoolean(PreferencesConstants.logInMPINFirstTime, value);
  }

  Future<bool> setGuildScreenShowed(bool value) {
    return _saveBoolean(PreferencesConstants.guildScreenShowed, value);
  }

  bool getGuildScreenShowed() {
    return _getBoolean(PreferencesConstants.guildScreenShowed);
  }

  setNotificationRead(String value) {
    return _saveString(PreferencesConstants.setNotificationRead, value);
  }

  String getNotificationReadStatus() {
    return _getString(PreferencesConstants.setNotificationRead);
  }

  Future<bool> storeMobileNumber(String value) {
    return _saveString(PreferencesConstants.mobileNumberKey, value);
  }

  Future<bool> saveTodayDate(String value) {
    return _saveString(PreferencesConstants.todayDate, value);
  }

  String? get todayDate => _getString(PreferencesConstants.todayDate);


  Future<bool> toggleBiometricToggled(bool value) {
    return _saveBoolean(PreferencesConstants.biometricEnabled, value);
  }


  bool get isBioMetricsEnabled =>
      _getBoolean(PreferencesConstants.biometricEnabled, defaultValue: false);

  bool get isComingFromAuthFlow =>
      _getBoolean(PreferencesConstants.comingFromAuthFlow, defaultValue: false);

  bool get isLoggedIn =>
      _getBoolean(PreferencesConstants.isLoggedIn, defaultValue: false);

  Future<bool> setFirstTimeInstalled(bool value) {
    return _saveBoolean(PreferencesConstants.isFirstTimeInstalled, value);
  }

  bool get isDarkMode =>
      _getInt(PreferencesConstants.themeMode, defaultValue: 0) == 1;

  Future<bool> setThemeMode(int value) {
    return _saveInt(PreferencesConstants.themeMode, value);
  }

  // Future<bool> storeUserInfo(UserModel value) {
  //
  //   return _saveString(PreferencesConstants.userInfo, userModelToJson(value));
  // }

  Future<bool> storeAuthToken(String value) {
    return _saveString(PreferencesConstants.authToken, value);
  }

  // UserModel get userInfo => userModelFromJson(
  //     _getString(PreferencesConstants.userInfo));

  String get authToken =>
      _getString(PreferencesConstants.authToken, defaultValue: '');

  Future<bool> deleteH()async{
    return await _sharedPreferences!.remove(PreferencesConstants.setHospital);
  }
}
