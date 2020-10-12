import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quotely/controllers/themecontroller.dart';
import 'package:quotely/screens/splash.dart';
import 'package:quotely/theme/theme.dart';

void main() async {
  await GetStorage.init();
  Get.put<ThemeController>(ThemeController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeController.to.getThemeModeFromStore();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //defaultTransition: Transition.fade,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeController.to.themeMode,
      home: Splash(),
    );
  }
}
