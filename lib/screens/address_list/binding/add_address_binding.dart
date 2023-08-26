import 'package:saket_sweets_app/core/repository/repo_impl.dart';
import 'package:saket_sweets_app/screens/address_list/controller/add_address_controller.dart';
import 'package:get/get.dart';

class AddAddressBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(RepoImpl());
    Get.put(AddAddressController());
  }
}
