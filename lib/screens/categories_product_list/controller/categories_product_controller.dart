import 'package:saket_sweets_app/core/repository/repo.dart';
import 'package:saket_sweets_app/core/repository/repo_impl.dart';
import 'package:saket_sweets_app/models/index.dart';
import 'package:get/get.dart';

class CategoriesProductController extends GetxController {
  late Repo _repo;
  RxBool isLoading = false.obs;
  var argumentData = Get.arguments;
  var img = '';
  var title = '';
  var id = '';

  CategoriesProductController() {
    _repo = Get.find<RepoImpl>();
    // id = box.read('id').toString();
    img = argumentData[0]['img'];
    title = argumentData[0]['title'];
    id = argumentData[0]['id'];
    hitApi();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    img = argumentData[0]['img'];
    title = argumentData[0]['title'];
    id = argumentData[0]['id'];
    hitApi();
  }

  var categoryList = <FoodItemDetails>[].obs;

  getCategoriesProductList() async {
    isLoading.toggle();
    try {
      final result = await _repo.hitShortCategoryApi(id);
      if (result != null) {
        if (result.status == 200) {
          categoryList.value = result.category;
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
    getCategoriesProductList();
  }
}
