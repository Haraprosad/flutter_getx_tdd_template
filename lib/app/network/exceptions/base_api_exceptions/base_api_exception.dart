import 'package:flutter_getx_tdd_template/app/network/exceptions/base_exceptions/app_exception.dart';

abstract class BaseApiException extends AppException{
  final int httpCode;
  final String status;

  BaseApiException({this.httpCode = -1, this.status = "", String message = ""})
      : super(message: message);
}