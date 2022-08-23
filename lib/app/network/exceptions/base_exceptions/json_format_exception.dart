import 'package:flutter_getx_tdd_template/app/network/exceptions/base_exceptions/base_exception.dart';

class JsonFormatException extends BaseException{
  JsonFormatException(String message):super(message: message);
}