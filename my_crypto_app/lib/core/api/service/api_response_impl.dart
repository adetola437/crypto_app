
// Concrete implementation of ApiResponse
import 'contracts/api_response.dart';

class ApiResponseImpl<T> implements ApiResponse<T> {

  final T? _data;
  final String? _message;
  final dynamic _errors;
  final int? _responseCode;
  

  ApiResponseImpl(this._data, this._errors, this._message, this._responseCode);

  @override
  T? get data => _data;   

  @override
  int get responseCode => _responseCode ?? 500;
  
  @override
  bool get isRequestSuccessful => _responseCode == 100;

  @override
  String get message => _message ?? '';

  @override
  dynamic get errors => _errors ?? '';
  
  @override
  String? get errorMessage{
    
     return 
    _errors!=null && _errors.toString().trim().isNotEmpty ?
     _errors

        .toString()
        .replaceAll("{", '')
        .replaceAll("}", '')
        .replaceAll("_", " ")
        .replaceAll("'", "")
        .replaceAll("\"", "")
        .replaceAll("[", '')
        .replaceAll("]", '')
        .replaceAll("non field errors:", "")
        .trim():
        'An Error occured'
        ;
  }



}