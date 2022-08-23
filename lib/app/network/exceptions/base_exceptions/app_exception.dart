import 'package:flutter_getx_tdd_template/app/network/exceptions/base_exceptions/base_exception.dart';

class AppException extends BaseException{
  AppException({String message = ""}):super(message: message);
}