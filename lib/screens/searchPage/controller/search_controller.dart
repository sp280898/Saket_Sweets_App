import 'package:saket_sweets_app/core/repository/repo.dart';
import 'package:saket_sweets_app/core/repository/repo_impl.dart';
import 'package:saket_sweets_app/models/foodItemDetails.dart';
import 'package:get/get.dart';

class SearchPageController extends GetxController {
  late Repo _repo;
  RxBool isLoading = false.obs;
  String id = '';

  SearchPageController() {
    _repo = Get.find<RepoImpl>();
  }

  var searchList = <FoodItemDetails>[].obs;

  getSearchList(String search) async {
    isLoading.toggle();
    try {
      final result = await _repo.getSearchResult(search);

      if (result != null) {
        if (result.status == 200) {
          searchList.value = result.search;
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

  hitApi(String search) {
    getSearchList(search);
  }
}
