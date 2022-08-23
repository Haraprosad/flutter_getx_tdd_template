import 'package:flutter_getx_tdd_template/app/network/exceptions/api_exceptions/api_exception.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

class NotFoundException extends ApiException{
  NotFoundException(String message, String status)
      : super(httpCode: HttpStatus.notFound, status: status,message: message);
}