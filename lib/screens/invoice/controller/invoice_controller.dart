import 'package:get/get.dart';
import 'package:saket_sweets_app/core/constent.dart';
import 'package:saket_sweets_app/core/repository/repo.dart';
import 'package:saket_sweets_app/core/repository/repo_impl.dart';
import 'package:saket_sweets_app/models/index.dart';

class InvoiceController extends GetxController {
  var totalPrice = '';

  late Repo _repo;
  var address = AddressDetails();
  var pinCodeData = PinCodeDetailsData();
  var deliveryCharge = '';
  RxList cartList = <FoodItemDetails>[].obs;
  RxBool isLoading = false.obs;
  String id = '';

  InvoiceController() {
    totalPrice = Get.arguments[0]['price'];
    _repo = Get.find<RepoImpl>();
    id = box.read('id').toString();
    hitApi();
  }

  getPrimaryAddress() async {
    isLoading.toggle();
    try {
      final result = await _repo.getPrimaryAddress(id);
      if (result != null) {
        print('200 pe: ${result.status} : ${result.msg}');
        if (result.status == 200) {
          address = result.primaryAddress!;
          getPincodeStatus(result.primaryAddress!.pin_code!);
        } else if (result.status == 201) {
          print('${result.status} : ${result.msg}');
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

  getPincodeStatus(String pinCode) async {
    isLoading.toggle();
    try {
      final result = await _repo.getPinCodeStatus(pinCode);

      if (result != null) {
        if (result.status == 200) {
          pinCodeData = result.pincode!;
          deliveryCharge = result.pincode!.delivary_amount!;
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

  getCartList() async {
    // isLoading.toggle();
    try {
      final result = await _repo.hitCartList(id);
      if (result != null) {
        print('200 pe: ${result.status} : ${result.msg}');
        if (result.status == 200) {
          cartList = result.cart.obs;
          countPrice(result.cart);
          print('cartList:' + cartList.length.toString());
        } else if (result.status == 201) {
          print('${result.status} : ${result.msg}');
        } else {
          print('Something went wrong');
        }
      }
    } on Exception catch (e) {
      // TODO

    } finally {
      // isLoading.toggle();
    }
  }

  hitApi() {
    print('hitApi hited');
    getPrimaryAddress();
    getCartList();
  }

  void countPrice(List<FoodItemDetails> cart) {
    int price = 0;
    for (var item in cart) {
      price = price + int.parse(item.total_price!);
    }
    totalPrice = price.toString();
  }
}
