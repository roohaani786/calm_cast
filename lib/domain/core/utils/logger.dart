import 'dart:convert';
import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';


class Logger {
  static bool _logEnabled = false;
  Logger.setLogger(bool enableLogger){
    _logEnabled = enableLogger;
  }
  static const _tag = "daily_schedule_planner";

  static i(dynamic info, {String tag = _tag, bool isJson = false}) {
    if (_logEnabled) {
      if (kDebugMode) {
        developer.log(isJson ? jsonEncode(info) : info, name: tag);
      } else {
        debugPrint("TAG: ${tag + (isJson ? jsonEncode(info) : info)}");
      }
    }
  }

  static log(String message, {String tag = _tag, StackTrace? stackTrace}) {
    if (_logEnabled) {
      if (kDebugMode) {
        developer.log(message, name: tag, stackTrace: stackTrace);
      }
    }
  }

  //Check in release mode
  static e(String message,
      {String tag = _tag, Object? error, StackTrace? stackTrace}) {
    if (_logEnabled) {
      if (kDebugMode) {
        developer.log(message, name: tag, error: error, stackTrace: stackTrace);
      } else {
        debugPrint(
            "TAG: $tag $message\n Error: $error\n StackTrace: $stackTrace");
      }
    }
  }
}
