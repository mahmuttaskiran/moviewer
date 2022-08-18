import 'dart:io';

class BaseResponse {
  static const _unknownError = "Unknown error";

  BaseResponse({required this.status, this.error});

  String? error;
  int status;

  bool get isSuccess => status == HttpStatus.ok;

  bool get hasError => status != HttpStatus.ok;

  String get errorMessage => error ?? _unknownError;
}
