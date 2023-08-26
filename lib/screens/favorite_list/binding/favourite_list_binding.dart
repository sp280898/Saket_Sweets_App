import 'package:get/get.dart';
import 'package:saket_sweets_app/core/repository/repo_impl.dart';
import 'package:saket_sweets_app/screens/favorite_list/controller/favourite_list_controller.dart';

class FavouriteListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RepoImpl());
    Get.lazyPut(() => FavouriteListController());
  }
}
