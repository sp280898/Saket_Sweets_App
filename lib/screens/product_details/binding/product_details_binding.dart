import 'package:saket_sweets_app/core/repository/repo_impl.dart';
import 'package:saket_sweets_app/screens/product_details/controller/product_details_controller.dart';
import 'package:get/get.dart';

class ProductDetailsbinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(RepoImpl());
    Get.put(ProductDetailsController());
  }
}
