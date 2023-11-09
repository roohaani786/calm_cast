import 'dart:convert';

import '../../models/api_error_model.dart';
import '../../models/api_response_model.dart';
import '../../utils/logger.dart';

mixin ApiResponseListener {
  static const int httpOk = 200;
  static const int badRequest = 400;
  static const int unauthorized = 401;
  static const int maintenance = 403;
  static const int methodNotAllowed = 405;
  static const int internalServerError = 500;
  static const int badGateWay = 502;
  static const int serviceUnavailable = 503;
  static const int noInternetConnection = -101;
  static const int unknown = -102;
  static const int dioCancelRequest = 000;

  ApiErrorModel onHttpFailure(ApiResponse? response) {
    try {
      if (response != null && response.httpStatusCode != null) {
        int statusCode = response.httpStatusCode!;
        switch (statusCode) {
          case httpOk:
          case badRequest:
            return ApiErrorModel.fromJson(response.responseData);
          case noInternetConnection:
            return ApiErrorModel(
                "No Internet Connection", statusCode);
          case internalServerError:
          case methodNotAllowed:
          case badGateWay:
          case serviceUnavailable:
            return ApiErrorModel("A Technical issue occurred", statusCode);
          case maintenance:
            return ApiErrorModel(
                "Server Under Maintenance", statusCode);
          default:
            return ApiErrorModel("A Technical issue occurred", statusCode);
        }
      }
    } catch (e) {
      Logger.e("ApiErrorResponse error", error: e);
    }

    return ApiErrorModel("Something Wrong", unknown);
  }
}

ErrorResponseData errorResponseDataFromJson(String str) =>
    ErrorResponseData.fromJson(json.decode(str));

String errorResponseDataToJson(ErrorResponseData data) =>
    json.encode(data.toJson());

class ErrorResponseData {
  final List<SubError>? errors;

  ErrorResponseData({
    this.errors,
  });

  ErrorResponseData copyWith({
    List<SubError>? errors,
  }) =>
      ErrorResponseData(
        errors: errors ?? this.errors,
      );

  factory ErrorResponseData.fromJson(Map<String, dynamic> json) =>
      ErrorResponseData(
        errors: json["errors"] == null
            ? []
            : List<SubError>.from(
                json["errors"]!.map((x) => SubError.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "errors": errors == null
            ? []
            : List<dynamic>.from(errors!.map((x) => x.toJson())),
      };
}

class SubError {
  final String? field;
  final String? message;
  final String? errorCode;

  SubError({
    this.field,
    this.message,
    this.errorCode,
  });

  SubError copyWith({
    String? field,
    String? message,
    String? errorCode,
  }) =>
      SubError(
        field: field ?? this.field,
        message: message ?? this.message,
        errorCode: errorCode ?? this.errorCode,
      );

  factory SubError.fromJson(Map<String, dynamic> json) => SubError(
        field: json["field"],
        message: json["message"],
        errorCode: json["error_code"],
      );

  Map<String, dynamic> toJson() => {
        "field": field,
        "message": message,
        "error_code": errorCode,
      };
}
