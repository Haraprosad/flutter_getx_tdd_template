import 'package:flutter_getx_tdd_template/app/network/exceptions/base_api_exceptions/base_api_exception.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

class UnauthorizedException extends BaseApiException{
  UnauthorizedException(String message)
  :super(httpCode: HttpStatus.unauthorized, message: message, status: "unauthorized");
}