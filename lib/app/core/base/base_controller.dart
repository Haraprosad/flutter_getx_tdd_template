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
  final logoutController = false.obs;

  ///Reload the page
  final _refreshController = false.obs;
  refreshPage(bool refresh) => _refreshController(refresh);

  ///Control page state
  final _pageStateController = PageState.DEFAULT.obs;
  PageState get pageState => _pageStateController.value;
  updatePageState(PageState state)=> _pageStateController(state);
  resetPageState() => _pageStateController(PageState.DEFAULT);
  showLoading() => updatePageState(PageState.LOADING);
  hideLoading() => resetPageState();

  ///Control Messages
  final _messageController = "".obs;
  String get message => _messageController.value;
  showMessage(String msg) => _messageController(msg);

  final _errorMessageController = "".obs;
  String get errorMessage => _errorMessageController.value;
  showErrorMessage(String msg) => _errorMessageController(msg);

  final _successMessageController = "".obs;
  String get successMessage => _messageController.value;
  showSuccessMessage(String msg) => _successMessageController(msg);

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
    } on AppException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message);
    } catch (error) {
      _exception = AppException(message: "$error");
      logger.e("Controller>>>>>> error $error");
    }

    if (onError != null) onError(_exception);

    onComplete == null ? hideLoading() : onComplete();

  }

  @override
  void onClose() {
    _messageController.close();
    _refreshController.close();
    _pageStateController.close();
    super.onClose();
  }
}
