import 'package:flutter/material.dart';
import 'package:flutter_getx_tdd_template/app/core/base/base_view.dart';

import 'package:get/get.dart';

import '../controllers/other_controller.dart';

class OtherView extends BaseView<OtherController> {
  final String viewParam;

  OtherView({this.viewParam = ""});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    //todo: add app bar
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return const Center(
      child: Text("OtherView",
      style: TextStyle(fontSize: 20),),
    );
  }

}
