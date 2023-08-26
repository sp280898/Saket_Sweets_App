import 'package:saket_sweets_app/core/constent.dart';
import 'package:saket_sweets_app/core/repository/repo.dart';
import 'package:saket_sweets_app/core/repository/repo_impl.dart';
import 'package:saket_sweets_app/models/index.dart';
import 'package:get/get.dart';

class FavouriteListController extends GetxController {
  late Repo _repo;
  RxBool isLoading = false.obs;
  String id = '';
  RxInt quantity = 1.obs;
  RxInt price = 0.obs;
  var addressStutas = '';
  AddressDetails? address = AddressDetails();

  FavouriteListController() {
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

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    hitApi();
  }

  var favouriteList = <FoodItemDetails>[].obs;

  getFavouriteList() async {
    // isLoading.toggle();
    try {
      final result = await _repo.hitFavouriteList(id);

      if (result != null) {
        if (result.status == 200) {
          favouriteList.value = result.favourite;
        } else if (result.status == 201) {
          print('201');
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

  getPrimaryAddress() async {
    isLoading.toggle();
    try {
      final result = await _repo.getPrimaryAddress(id);
      if (result != null) {
        print('200 pe: ${result.status} : ${result.msg}');
        if (result.status == 200) {
          addressStutas = result.status.toString();
          print('addressStutas: $addressStutas');
          address = result.primaryAddress!;
        } else if (result.status == 201) {
          addressStutas = result.status.toString();
          print('addressStutas: $addressStutas');
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

  addToCart(String foodId, String price, String quantity) async {
    isLoading.toggle();
    try {
      final result = await _repo.hitAddCartApi(id, foodId, quantity, price);

      if (result != null) {
        if (result.status == 200) {
          Get.snackbar('Response', 'food added successfully',
              snackPosition: SnackPosition.BOTTOM);
          Get.toNamed('/cartPage');
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

  hitRemoveApi(String favID) async {
    // isLoading.toggle();
    try {
      final result =
          await _repo.hitRemoveFavItemApi(favID, box.read('id').toString());
      if (result != null) {
        print('200 pe: ${result.status} : ${result.msg}');
        getFavouriteList();
      }
    } on Exception catch (e) {
      // TODO

    } finally {
      // isLoading.toggle();
    }
  }

  hitApi() {
    getFavouriteList();
    getPrimaryAddress();
  }
}
