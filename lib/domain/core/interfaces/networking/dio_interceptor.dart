import 'dart:convert';
import 'package:dio/dio.dart';

import '../../prefs/app_preferences.dart';
import '../../utils/logger.dart';




class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    {
      if (AppPreferences.instance.authToken.isNotEmpty) {
        options.headers.addAll({
          "Authorization": AppPreferences.instance.authToken,
          // 'Content-Type': 'application/json',
        });
      } else {}
      options.validateStatus = (statusCode) {
        if (statusCode == null) {
          return false;
        }
        switch (statusCode) {
          case 400:
          case 404:
            return false;
          case 405:
          case 403:
          case 422:
          case 401:
          default:
            {
              if (statusCode >= 200 && statusCode < 300) {
                return true;
              } else {
                /// ToDo: Design app is not working popup
                return false;
              }
            }
        }
      };

      Logger.i(options.headers, tag: "HEADER", isJson: true);


      return super.onRequest(options, handler);
    }
  }

    @override
    void onResponse(Response response, ResponseInterceptorHandler handler) {
      if (response.data != null) {
        var data = response.data;
        var jsonData = jsonDecode(data);
        response.data = jsonData;
      }
      // Response decryptedResponse = Response(requestOptions: response.requestOptions, data:jsonData  , statusCode: response.statusCode ) ;
      super.onResponse(response, handler);
    }
  }
