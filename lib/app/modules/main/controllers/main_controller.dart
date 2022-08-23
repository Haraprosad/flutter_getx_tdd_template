import 'package:flutter_getx_tdd_template/app/core/base/base_controller.dart';
import 'package:flutter_getx_tdd_template/app/modules/main/model/menu_code.dart';
import 'package:get/get.dart';

class MainController extends BaseController {
  final _selectedMenuCodeController = MenuCode.HOME.obs;

  MenuCode get selectedMenuCode => _selectedMenuCodeController.value;

  final lifeCardUpdateController = false.obs;

  onMenuSelected(MenuCode menuCode) async => _selectedMenuCodeController(menuCode);
}
