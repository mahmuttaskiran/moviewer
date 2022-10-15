import 'dart:io';

class BaseResponse {
  static const _unknownError = "Unknown error";

  String? error;
  late int status;

  bool get isSuccess => status == HttpStatus.ok;

  bool get hasError => status != HttpStatus.ok;

  String get errorMessage => error ?? _unknownError;
}
