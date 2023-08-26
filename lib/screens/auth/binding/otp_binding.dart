import 'package:saket_sweets_app/core/repository/repo_impl.dart';
import 'package:get/get.dart';
import 'package:saket_sweets_app/screens/auth/controller/otp_controller.dart';

class OtpBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(RepoImpl());
    Get.put(OtpController());
  }
}
