import 'package:saket_sweets_app/core/repository/repo_impl.dart';
import 'package:saket_sweets_app/screens/payment_getway/controller/payment_getway_controller.dart';
import 'package:get/get.dart';

class PaymentGetwayBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(RepoImpl());
    Get.put(PaymentGetwayController());
  }
}
