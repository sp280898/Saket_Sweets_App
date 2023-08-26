import 'package:saket_sweets_app/core/repository/repo_impl.dart';
import 'package:get/get.dart';
import 'package:saket_sweets_app/screens/food_list/controller/food_list_controller.dart';

class FoodListBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(RepoImpl());
    Get.put(FoodListController());
  }
}
