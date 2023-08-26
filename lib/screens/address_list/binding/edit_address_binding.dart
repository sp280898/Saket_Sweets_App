import 'package:saket_sweets_app/screens/address_list/controller/edit_address_controller.dart';
import 'package:get/get.dart';
import 'package:saket_sweets_app/core/repository/repo_impl.dart';

class EditAddressBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(RepoImpl());
    Get.put(EditAddressController());
  }
}
