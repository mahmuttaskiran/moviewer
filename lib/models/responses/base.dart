class BaseResponse {
  BaseResponse({required this.status, this.error});

  String? error;
  int status;
}
