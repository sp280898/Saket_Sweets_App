import 'package:saket_sweets_app/core/constent.dart';
import 'package:saket_sweets_app/core/repository/repo.dart';
import 'package:saket_sweets_app/core/repository/repo_impl.dart';
import 'package:saket_sweets_app/models/index.dart';
import 'package:get/get.dart';

class CartListController extends GetxController {
  late Repo _repo;
  var editCartList = EditCartDetailsData();
  RxList cartList = <FoodItemDetails>[].obs;
  RxBool isLoading = false.obs;
  String id = '';
  String totalPrice = '';
  String addressStutas = '';
  AddressDetails? address = AddressDetails();

  CartListController() {
    _repo = Get.find<RepoImpl>();
    id = box.read('id').toString();
    hitApi();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    hitApi();
  }

  getPrimaryAddress() async {
    isLoading.toggle();
    try {
      final result = await _repo.getPrimaryAddress(box.read('id').toString());
      if (result != null) {
        addressStutas = result.status.toString();
        print('200 pe: ${result.status} : ${result.msg}');
        if (result.status == 200) {
          address = result.primaryAddress!;
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

  // @override
  // void onReady() {
  //   // TODO: implement onReady
  //   super.onReady();
  //   cartList.clear();
  //   hitApi();
  // }

  getCartList() async {
    // isLoading.toggle();
    try {
      final result = await _repo.hitCartList(id);
      if (result != null) {
        print('200 pe: ${result.status} : ${result.msg}');
        if (result.status == 200) {
          cartList.clear();
          cartList = result.cart.obs;
          cartList.refresh();
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

  hitRemoveApi(String cartID) async {
    // isLoading.toggle();
    try {
      final result =
          await _repo.hitRemoveCartItem(cartID, box.read('id').toString());
      if (result != null) {
        print('200 pe: ${result.status} : ${result.msg}');
        getCartList();
      }
    } on Exception catch (e) {
      // TODO

    } finally {
      // isLoading.toggle();
    }
  }

  hitEditCart(String cartID, String quantity, String totalPrice) async {
    // isLoading.toggle();
    try {
      final result = await _repo.hitEditCartItem(
          box.read('id').toString(), cartID, quantity, totalPrice);
      if (result != null) {
        print('200 pe: ${result.status} : ${result.msg}');
        if (result.status == 200) {
          editCartList = result.cart;
          hitApi();
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

  hitCartRemoveItem(String cartID, String userID) async {
    isLoading.toggle();
    try {
      final result = await _repo.hitRemoveCartItem(cartID, userID);
      if (result != null) {
        if (result.status == 200) {
          cartList.clear();
          cartList = result.cart.obs;
          countPrice(result.cart);
          cartList.refresh();

          print('cartList:' + cartList.length.toString());
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

  hitEditApi(String cartID, String quantity, String price) {
    hitEditCart(cartID, quantity, price);
  }

  hitApi() {
    print('hitApi hited');
    getCartList();
    getPrimaryAddress();
  }

  void countPrice(List<FoodItemDetails> cart) {
    int price = 0;
    for (var item in cart) {
      price = price + int.parse(item.total_price!);
    }
    totalPrice = price.toString();
  }
}
