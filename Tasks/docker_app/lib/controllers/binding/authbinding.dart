import 'package:docker_app/controllers/authcontroller.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put<AuthController>(AuthController(), permanent: true);
  }
}
