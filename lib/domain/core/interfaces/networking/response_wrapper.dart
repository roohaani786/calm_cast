


import '../../models/result_model.dart';

class ApiResponseWrapper<T> {
  String? responseStatus;
  String? responseCode;
  int? responseHttpCode;

  T? data;
  int? statusCode;
  ApiStatus status;
  ApiResponseWrapper.from(
      {required this.data,
      required this.responseCode,
      required this.responseHttpCode,
      required this.responseStatus,
      this.statusCode})
      : status = data != null ? ApiStatus.success : ApiStatus.empty;
  ApiResponseWrapper.networkError(
      {this.statusCode, this.data, required int httpStatusCode})
      : status = ApiStatus.networkError;

  ApiResponseWrapper.serverError(
      {this.statusCode,
      this.data,
      this.responseCode,
      this.responseHttpCode,
      this.responseStatus})
      : status = ApiStatus.serverError;

  bool get isSuccess => status == ApiStatus.success;
}
