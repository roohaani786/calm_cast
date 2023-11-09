class ApiErrorModel {
  final String message;
  final int httpStatusCode;
  final bool? status;
  String tag;

  ApiErrorModel(this.message, this.httpStatusCode,
      {this.status = false, this.tag = ""});

  ApiErrorModel.fromJson(Map<String, dynamic> parsedJson)
      : message = (parsedJson['errors'] is List)
      ? parsedJson['errors'].length > 0
      ? parsedJson['errors'][0]['message'] ?? ""
      : ""
      : (parsedJson['errors'] ?? ""),
        status = parsedJson['status'],
        httpStatusCode = parsedJson['httpStatusCode'],
        tag = parsedJson['tag'];
}
