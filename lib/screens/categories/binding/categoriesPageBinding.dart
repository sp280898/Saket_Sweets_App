import 'package:saket_sweets_app/core/repository/repo_impl.dart';
import 'package:saket_sweets_app/screens/categories/controller/categoriesPageController.dart';
import 'package:get/get.dart';

class CategoriesPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RepoImpl());
    Get.put(CategoriesPageController());
  }
}
