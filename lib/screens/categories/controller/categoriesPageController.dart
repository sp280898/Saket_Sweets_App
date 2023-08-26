import 'package:saket_sweets_app/core/repository/repo.dart';
import 'package:saket_sweets_app/core/repository/repo_impl.dart';
import 'package:saket_sweets_app/models/index.dart';
import 'package:get/get.dart';

class CategoriesPageController extends GetxController {
  late Repo _repo;
  RxBool isLoading = false.obs;

  CategoriesPageController() {
    _repo = Get.find<RepoImpl>();
    hitApi();
  }

  var categories = <CategoryDetails>[].obs;

  getCategoryList() async {
    isLoading.toggle();
    try {
      final result = await _repo.getCategoryList();

      if (result != null) {
        if (result.status == 200) {
          categories.value = result.category;
          print('Banner:' + categories.length.toString());
        } else if (result.status == 201) {
          print('201');
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

  hitApi() {
    getCategoryList();
  }
}
