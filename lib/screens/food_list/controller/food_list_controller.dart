import 'package:saket_sweets_app/core/constent.dart';
import 'package:saket_sweets_app/core/repository/repo.dart';
import 'package:saket_sweets_app/core/repository/repo_impl.dart';
import 'package:saket_sweets_app/models/index.dart';
import 'package:get/get.dart';

class FoodListController extends GetxController {
  RxString greetingStatus = ''.obs;
  RxString greetingValue = ''.obs;
  RxString greetingTime = ''.obs;
  RxString pincode = ''.obs;
  RxBool size = false.obs;
  late Repo _repo;
  RxBool isLoading = false.obs;

  FoodListController() {
    _repo = Get.find<RepoImpl>();
    checkSubscription();
    getList();
    getPrimaryAddress();
  }

  var banners = <BannerDetails>[].obs;
  var categories = <CategoryDetails>[].obs;
  var foodItemList = <FoodItemDetails>[].obs;
  AddressDetails? primaryAddress = AddressDetails();

  @override
  void onInit() {
    super.onInit();
    getMealTime();
  }

  getList() async {
    isLoading.toggle();
    try {
      final result = await _repo.getHomePageList(box.read('id').toString());

      if (result != null) {
        if (result.status == 200) {
          banners.value = result.banner!;
          categories.value = result.category!;
          foodItemList.value = result.foodItem!;
          primaryAddress = result.primaryAddress;
          size.value = true;
          print('primaryAddress:' + primaryAddress.toString());
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

  void getPrimaryAddress() async {
    try {
      final result = await _repo.getPrimaryAddress(box.read('id').toString());
      if (result != null) {
        print('200 pe: ${result.status} : ${result.msg}');
        if (result.status == 200) {
          pincode.value = result.primaryAddress!.pin_code.toString();
          print('Pincode11111: ${result.primaryAddress!.pin_code.toString()}');
        } else if (result.status == 201) {
          print('${result.status} : ${result.msg}');
          pincode.value = '';
        } else {
          print('Something went wrong');
        }
      }
    } on Exception catch (e) {
      // TODO
    }
  }

  void checkSubscription() async {
    try {
      final result =
          await _repo.hitSubscriptionCheckApi(box.read('id').toString());
      if (result != null) {
        print('200 pe: ${result.status} : ${result.msg}');
        if (result.status == 200) {
          print('msg: ${result.msg.toString()}');
        } else if (result.status == 201) {
          print('${result.status} : ${result.msg}');
        } else {
          print('Something went wrong');
        }
      }
    } on Exception catch (e) {
      // TODO
    }
  }

  getMealTime() {
    var time = DateTime.now();
    var hour = time.hour;
    print('Hour : $hour');
    // greetingStatus.value = hour.toString();
    if (hour > 5 && hour < 11) {
      greetingStatus.value = 'Breakfast Time';
      greetingValue.value = 'Break Fast';
      greetingTime.value = '06 AM - 10 AM';
    } else if (hour > 10 && hour < 16) {
      greetingStatus.value = 'Lunch Time';
      greetingValue.value = 'Lunch Time';
      greetingTime.value = '12 PM - 03 PM';
    } else if (hour > 15 && hour < 21) {
      greetingStatus.value = 'Dinner Time';
      greetingValue.value = 'Dinner Time';
      greetingTime.value = '06 PM - 09 PM';
    } else {
      greetingStatus.value = 'Kitchen Closed';
      greetingValue.value = 'closed';
      greetingTime.value = '10 PM - 06 AM';
    }
  }
}
