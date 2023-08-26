import 'package:get/get.dart';
import 'package:saket_sweets_app/core/constent.dart';
import 'package:saket_sweets_app/core/repository/repo.dart';
import 'package:saket_sweets_app/core/repository/repo_impl.dart';
import 'package:saket_sweets_app/models/index.dart';

class ProfileController extends GetxController {
  late Repo _repo;
  RxString userName = ''.obs;
  RxString userMobile = ''.obs;

  ProfileController() {
    _repo = Get.find<RepoImpl>();
    int id = box.read('id');
    getProfileDetails();
  }
  ProfileDetails? profileData = ProfileDetails();
  RxBool isLoading = false.obs;

  void getProfileDetails() async {
    isLoading.toggle();
    try {
      final result = await _repo.getProfileDetails(box.read('id').toString());
      if (result != null) {
        if (result.status == 200) {
          profileData = result.profile;
          userName.value = result.profile.name.toString();
          userMobile.value = result.profile.mobile.toString();
        } else if (result.status == 201) {
          print('${result.status} : ${result.msg}');
        } else {
          print('Something went wrong');
        }
      }
    } on Exception catch (e) {
      // TODO

    } finally {
      isLoading.toggle();
    }
  }
}
