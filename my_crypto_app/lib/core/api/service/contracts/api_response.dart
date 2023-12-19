abstract class ApiResponse<T> {
  String? get message;
  int get responseCode;
  bool get isRequestSuccessful;
  dynamic get errors;
  T? get data;
  String? get errorMessage;
}
