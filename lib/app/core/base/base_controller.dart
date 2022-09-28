import 'package:flutter_getx_tdd_template/app/core/model/page_state.dart';
import 'package:flutter_getx_tdd_template/app/network/exceptions/api_exceptions/api_exception.dart';
import 'package:flutter_getx_tdd_template/app/network/exceptions/api_exceptions/not_found_exception.dart';
import 'package:flutter_getx_tdd_template/app/network/exceptions/base_api_exceptions/service_unavailable_exception.dart';
import 'package:flutter_getx_tdd_template/app/network/exceptions/base_api_exceptions/unauthorized_exception.dart';
import 'package:flutter_getx_tdd_template/app/network/exceptions/base_exceptions/app_exception.dart';
import 'package:flutter_getx_tdd_template/app/network/exceptions/base_exceptions/json_format_exception.dart';
import 'package:flutter_getx_tdd_template/app/network/exceptions/base_exceptions/network_exception.dart';
import 'package:flutter_getx_tdd_template/app/network/exceptions/base_exceptions/timeout_exception.dart';
import 'package:flutter_getx_tdd_template/flavors/build_config.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

abstract class BaseController extends GetxController{
  ///For logging access in whole app
  final Logger logger = BuildConfig.instance.config.logger;

  ///logout controlling
  // final isLoggedOut = false.obs;

  ///Reload the page
  final _shouldRefresh = false.obs;
  refreshPage(bool refresh) => _shouldRefresh(refresh);

  ///Control page state
  final _pageStateContainer = PageState.DEFAULT.obs;
  PageState get pageState => _pageStateContainer.value;
  updatePageState(PageState state)=> _pageStateContainer(state);
  resetPageState() => _pageStateContainer(PageState.DEFAULT);
  showLoading() => updatePageState(PageState.LOADING);
  hideLoading() => resetPageState();

  ///General Message Handler
  final _messageContainer = "".obs;
  String get message => _messageContainer.value;
  showMessage(String msg) => _messageContainer(msg);

  ///Error Message Handler
  final _errorMessageContainer = "".obs;
  String get errorMessage => _errorMessageContainer.value;
  showErrorMessage(String msg) => _errorMessageContainer(msg);

  ///Success Message Handler
  final _successMessageContainer = "".obs;
  String get successMessage => _messageContainer.value;
  showSuccessMessage(String msg) => _successMessageContainer(msg);

  /// According to api call change page state and show messages
  dynamic callDataService<T>(
        Future<T> future,{
        Function(Exception exception)? onError,
        Function(T response)? onSuccess,
        Function? onStart,
        Function? onComplete,}
      ) async{

    Exception? _exception;

    /// When api call initiates, show loading
    onStart == null? showLoading(): onStart();

    /// api call
    try{

      final T response = await future;

      if(onSuccess != null) onSuccess(response);

      onComplete == null ? hideLoading() : onComplete();

      return response;

    } on ServiceUnavailableException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message);
    } on UnauthorizedException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message);
    } on TimeoutException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message);
    } on NetworkException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message);
    } on JsonFormatException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message);
    } on NotFoundException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message);
    } on ApiException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message);
    } on AppException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message);
    } catch (error) {
      _exception = AppException(message: "$error");
      showErrorMessage("$error");
      logger.e("Controller>>>>>> error $error");
    }

    if (onError != null) onError(_exception);

    onComplete == null ? hideLoading() : onComplete();

  }

}
