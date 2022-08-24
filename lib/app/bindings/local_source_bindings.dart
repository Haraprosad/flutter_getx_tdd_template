import 'package:flutter_getx_tdd_template/app/data/local/preference_manager.dart';
import 'package:flutter_getx_tdd_template/app/data/local/preference_manager_impl.dart';
import 'package:get/get.dart';


class LocalSourceBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PreferenceManager>(
          () => PreferenceManagerImpl(),
      tag: (PreferenceManager).toString(),
      fenix: true,
    );
  }
}
