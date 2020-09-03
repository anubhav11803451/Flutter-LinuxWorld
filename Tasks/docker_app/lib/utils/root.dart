import 'package:docker_app/controllers/authcontroller.dart';
import 'package:docker_app/controllers/usercontroller.dart';
import 'package:docker_app/screens/home/home.dart';
import 'package:docker_app/screens/login/login.dart';
import 'package:docker_app/screens/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Root extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return GetX(
      initState: (_) async {
        Get.put<UserController>(UserController());
      },
      builder: (_) {
        if (Get.find<AuthController>().user?.uid != null) {
          return Home();
        } else {
          return Login();
        }
      },
    );
  }
}
