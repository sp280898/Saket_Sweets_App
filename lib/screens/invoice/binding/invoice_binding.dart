import 'package:get/get.dart';
import 'package:saket_sweets_app/core/repository/repo_impl.dart';
import 'package:saket_sweets_app/screens/invoice/controller/invoice_controller.dart';

class InvoiceBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => RepoImpl());
    Get.lazyPut(() => InvoiceController());
  }
}
