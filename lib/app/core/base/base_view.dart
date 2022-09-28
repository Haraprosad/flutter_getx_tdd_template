import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getx_tdd_template/app/core/base/base_controller.dart';
import 'package:flutter_getx_tdd_template/app/core/model/page_state.dart';
import 'package:flutter_getx_tdd_template/app/core/values/app_colors.dart';
import 'package:flutter_getx_tdd_template/app/core/widget/loading.dart';
import 'package:flutter_getx_tdd_template/flavors/build_config.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

abstract class BaseView<Controller extends BaseController> extends GetView<Controller>{
  /// get global key
  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  ///get logger in all views
  final Logger logger = BuildConfig.instance.config.logger;


  ///appBar widget declaration
  PreferredSizeWidget? appBar(BuildContext context);

  /// body widget declaration
  Widget body(BuildContext context);

  ///base build widget
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        children: [
          annotatedRegion(context),
          Obx(() => controller.pageState == PageState.LOADING
              ? _showLoading()
              : Container()),
          Obx(() => controller.errorMessage.isNotEmpty
              ? showSnackBar(controller.errorMessage)
              : Container()),
          Obx(() => controller.successMessage.isNotEmpty
              ? showSnackBar(controller.successMessage)
              : Container()),
          Obx(() => controller.message.isNotEmpty
              ? showSnackBar(controller.message)
              : Container()),
          Container(),
        ],
      ),
    );
  }

  /// annoted region for Scaffold and statusbar design
  Widget annotatedRegion(BuildContext context){
    return AnnotatedRegion(
        value: SystemUiOverlayStyle(
          ///Status bar color for android
          statusBarColor: statusBarColor(),
          statusBarIconBrightness: Brightness.dark,
        ),
        child: Material(
          color: Colors.transparent,
          child: pageScaffold(context),
        ),
    );
  }

  /// Page Scaffold elements organization and design
  Widget pageScaffold(BuildContext context){
    return Scaffold(
      ///Status bar color for ios
      backgroundColor: pageBackgroundColor(),
      key: globalKey,
      appBar: appBar(context),
      floatingActionButton: floatingActionButton(),
      body: pageContent(context),
      bottomNavigationBar: bottomNavigationBar(),
      drawer: drawer(),
    );
  }

  /// Default pageContent
  Widget pageContent(BuildContext context){
    return SafeArea(
        child: body(context),
    );
  }

  /// show error snackbar
  Widget showSnackBar(String message){
    final snackBar = SnackBar(content: Text(message));
    WidgetsBinding.instance?.addPersistentFrameCallback((timeStamp) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
    });

    return Container();
  }

  /// show toast message
  void showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        timeInSecForIosWeb: 1
    );
  }

  /// background color
  Color pageBackgroundColor() {
    return AppColors.pageBackground;
  }

  ///statusBar color
  Color statusBarColor() {
    return AppColors.pageBackground;
  }

  ///Default FloatingActionButton
  Widget? floatingActionButton() {
    return null;
  }

  ///Default BottomNavigationBar
  Widget? bottomNavigationBar() {
    return null;
  }

  ///Default Drawer
  Widget? drawer() {
    return null;
  }

  ///Default loading widget
  Widget _showLoading() {
    return const Loading();
  }

}