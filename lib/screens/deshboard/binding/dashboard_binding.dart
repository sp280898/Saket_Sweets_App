import 'package:saket_sweets_app/core/repository/repo_impl.dart';
import 'package:saket_sweets_app/screens/cart/controller/cart_list_controller.dart';
import 'package:saket_sweets_app/screens/deshboard/controller/dashboard_controller.dart';
import 'package:saket_sweets_app/screens/favorite_list/controller/favourite_list_controller.dart';
import 'package:saket_sweets_app/screens/home/controller/home_page_controller.dart';
import 'package:saket_sweets_app/screens/profile/controller/profile_controller.dart';
import 'package:get/get.dart';

class DeshboardBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(RepoImpl());
    Get.lazyPut<DeshboardController>(() => DeshboardController());
    Get.lazyPut<HomePageController>(() => HomePageController());
    Get.lazyPut<CartListController>(() => CartListController());
    Get.lazyPut<FavouriteListController>(() => FavouriteListController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
