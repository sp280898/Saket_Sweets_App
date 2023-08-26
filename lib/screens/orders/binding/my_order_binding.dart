import 'package:saket_sweets_app/core/repository/repo_impl.dart';
import 'package:saket_sweets_app/screens/orders/controller/my_order_controller.dart';
import 'package:get/get.dart';

class MyOrderBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(RepoImpl());
    Get.put(MyOrderController());
  }
}
