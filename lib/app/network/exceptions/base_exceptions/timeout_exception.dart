import 'package:flutter_getx_tdd_template/app/network/exceptions/base_exceptions/base_exception.dart';

class TimeoutException extends BaseException{
  TimeoutException(String messsage) : super(message: messsage);
}