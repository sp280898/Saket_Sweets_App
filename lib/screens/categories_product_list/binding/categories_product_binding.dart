import 'package:saket_sweets_app/core/repository/repo_impl.dart';
import 'package:saket_sweets_app/screens/categories_product_list/controller/categories_product_controller.dart';
import 'package:get/get.dart';

class CategoriesProductBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(RepoImpl());
    Get.put(CategoriesProductController());
  }
}
