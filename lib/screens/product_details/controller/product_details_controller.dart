import 'package:saket_sweets_app/core/constent.dart';
import 'package:saket_sweets_app/core/repository/repo.dart';
import 'package:saket_sweets_app/core/repository/repo_impl.dart';
import 'package:saket_sweets_app/models/addressDetails.dart';
import 'package:saket_sweets_app/models/foodItemDetails.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  late Repo _repo;
  RxBool isLoading = false.obs;
  String id = '';
  String userID = '';
  String route = '';
  String index = '';
  RxBool size = false.obs;
  var isFav = "".obs;
  RxInt quantity = 1.obs;
  RxInt price = 0.obs;
  String addressStutas = '';
  AddressDetails? address = AddressDetails();
  List addSubItem = [];

  ProductDetailsController() {
    _repo = Get.find<RepoImpl>();
    userID = box.read('id').toString();
    id = Get.arguments[0]['id'];
    route = Get.arguments[0]['route'];
    index = Get.arguments[0]['index'];
    hitApi();
  }

  FoodItemDetails foodItemDetails = FoodItemDetails();
  var foodItemList = <FoodItemDetails>[].obs;
  var relatedfoodItemList = <FoodItemDetails>[].obs;

  getFoodDetails() async {
    try {
      final result = await _repo.getFoodDetails(id, box.read('id').toString());

      if (result != null) {
        if (result.status == 200) {
          isFav.value = result.favourite.toString();
          foodItemDetails = result.foodDetail;
          foodItemList.value = result.all;
          relatedfoodItemList.value = result.subfood;
          price.value = (box.read('userType') == "wholesale")
              ? int.parse(result.foodDetail.wholesaler_price!)
              : int.parse(result.foodDetail.price!);
          size.value = true;
        } else {
          print('Something went wrong');
        }
      }
    } on Exception catch (e) {
      // TODO
    } finally {}
  }

  getPrimaryAddress() async {
    try {
      final result = await _repo.getPrimaryAddress(userID);
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
    } finally {}
  }

  addToCart(String price, String quantity) async {
    try {
      final result = await _repo.hitAddCartApi(
          userID, addSubItem.toString(), quantity, price);

      if (result != null) {
        if (result.status == 200) {
          Get.snackbar('Response', 'food added successfully',
              snackPosition: SnackPosition.BOTTOM);
          Get.offNamed('/cartPage');
          size.value = true;
          // print('image ${foodItemDetails.image}');
          // print('201');
        } else {
          print('Something went wrong');
        }
      }
    } on Exception catch (e) {
      // TODO
    } finally {}
  }

  addFavroute() async {
    try {
      final result = await _repo.hitAddFavouriteApi(userID, id);

      if (result != null) {
        if (result.status == 200) {
          Get.snackbar('Response', 'food added successfully',
              snackPosition: SnackPosition.BOTTOM);
          Get.offNamed('/favoritePage');
          size.value = true;
          print('image ${foodItemDetails.image}');
          print('201');
        } else {
          print('Something went wrong');
        }
      }
    } on Exception catch (e) {
      // TODO
    } finally {}
  }

  hitApi() {
    isLoading.toggle();
    getPrimaryAddress();
    getFoodDetails();
    isLoading.toggle();
  }
}
