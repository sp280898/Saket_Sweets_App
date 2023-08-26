import 'package:saket_sweets_app/core/repository/repo_impl.dart';
import 'package:get/get.dart';
import 'package:saket_sweets_app/screens/home/controller/home_page_controller.dart';

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(RepoImpl());
    Get.put(HomePageController());
  }
}
