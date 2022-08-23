import 'package:flutter_getx_tdd_template/app/network/exceptions/base_api_exceptions/base_api_exception.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

class ServiceUnavailableException extends BaseApiException{
  ServiceUnavailableException(String message)
      :super(httpCode: HttpStatus.serviceUnavailable,message: message,status: "service_unavailable");
}