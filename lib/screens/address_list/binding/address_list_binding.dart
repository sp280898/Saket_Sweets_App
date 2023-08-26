import 'package:get/get.dart';
import 'package:saket_sweets_app/core/repository/repo_impl.dart';
import 'package:saket_sweets_app/screens/address_list/controller/address_list_controller.dart';
import 'package:saket_sweets_app/screens/home/controller/home_page_controller.dart';

class AddressListBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(RepoImpl());
    Get.put(AddressListController());
  }
}
