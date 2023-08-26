import 'package:saket_sweets_app/core/repository/repo_impl.dart';
import 'package:saket_sweets_app/screens/cart/controller/cart_list_controller.dart';
import 'package:get/get.dart';

class CartListBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => RepoImpl());
    Get.lazyPut(() => CartListController());
  }
}
