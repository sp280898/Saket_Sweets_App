import 'package:get/get.dart';
import 'package:saket_sweets_app/core/repository/repo_impl.dart';
import 'package:saket_sweets_app/screens/profile/controller/edit_profile_controller.dart';

class EditProfileBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(RepoImpl());
    Get.put(EditProfileController());
  }
}
