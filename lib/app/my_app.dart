import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_getx_tdd_template/app/bindings/initial_binding.dart';
import 'package:flutter_getx_tdd_template/app/routes/app_pages.dart';
import 'package:flutter_getx_tdd_template/flavors/env_config.dart';
import 'package:get/get.dart';

import '../flavors/build_config.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final EnvConfig _envConfig = BuildConfig.instance.config;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: _envConfig.appName,
      initialRoute: AppPages.INITIAL,
      initialBinding: InitialBinding(),
      getPages: AppPages.routes,
      ///******* For System selected language change *****************
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,

      //todo: note should be prepared on theme
      theme: ThemeData(
        //primarySwatch: AppColors.colorPrimarySwatch,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.light,
        //primaryColor: AppColors.colorPrimary,
        textTheme: const TextTheme(
          button: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        fontFamily: 'Roboto',
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

