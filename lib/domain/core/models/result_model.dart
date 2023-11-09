enum ApiStatus { empty, loading, success, networkError, serverError }

class Result<T> {
  ApiStatus status;
  T? apiResponse;

  Result.empty() : status = ApiStatus.empty;

  Result.loading() : status = ApiStatus.loading;

  Result.success(this.apiResponse) : status = ApiStatus.success;

  Result.networkError(this.apiResponse) : status = ApiStatus.networkError;

  Result.serverError(this.apiResponse) : status = ApiStatus.serverError;

  @override
  String toString() {
    return "Status : $status";
  }
}
