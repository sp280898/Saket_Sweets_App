import 'package:get/get.dart';
import 'package:saket_sweets_app/screens/auth/controller/signin_controller.dart';

class SigninBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(SigninController());
  }
}
