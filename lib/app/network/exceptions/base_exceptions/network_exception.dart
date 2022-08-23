import 'package:flutter_getx_tdd_template/app/network/exceptions/base_exceptions/base_exception.dart';

class NetworkException extends BaseException{
  NetworkException(String message) : super(message: message);
}