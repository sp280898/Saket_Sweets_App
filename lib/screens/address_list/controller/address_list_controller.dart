import 'package:get/get.dart';
import 'package:saket_sweets_app/core/constent.dart';
import 'package:saket_sweets_app/core/repository/repo.dart';
import 'package:saket_sweets_app/core/repository/repo_impl.dart';
import 'package:saket_sweets_app/models/index.dart';

class AddressListController extends GetxController {
  late Repo _repo;
  RxBool isLoading = false.obs;
  String id = '';
  RxString relation = "".obs;
  RxString response = "".obs;
  RxBool isDilogOpen = false.obs;
  RxString pinCode = ''.obs;
  var addressList = <AddressDetails>[].obs;

  AddressListController() {
    _repo = Get.find<RepoImpl>();
    id = box.read('id').toString();
    hitApi(id);
    addressList.clear();
  }

  // @override
  // void onInit() {
  //   // TODO: implement onInit
  //   super.onInit();
  //   id = box.read('id').toString();
  //   hitApi(id);
  // }

  getAddressList(id) async {
    isLoading.toggle();
    try {
      final result = await _repo.getAddressList(id);

      if (result != null) {
        if (result.status == 200) {
          addressList.clear();
          // addressList.value = result.address;
          addressList = result.address.obs;
          checkList(result.address.length, result.address);
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

  hitAddressDeleteApi(String userID, String addressID) async {
    isLoading.toggle();
    try {
      final result = await _repo.hitDeleteAddressApi(addressID, userID);

      if (result != null) {
        if (result.status == 200) {
          addressList.value = result.address;
          // hitApi(id);
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

  setPrimaryAddress(
    String addressID,
    String userID,
  ) async {
    isLoading.toggle();
    try {
      final result = await _repo.hitSetPrimaryAddress(addressID, userID, '1');

      if (result != null) {
        if (result.status == 200) {
          addressList.value = result.address;
          getPrimaryAddress();
          // hitApi(id);
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

  hitApi(String id) {
    getAddressList(id);
  }

  void checkList(int length, List<AddressDetails> address) {
    if (length == 1 && address[0].primary_type != '1') {
      setPrimaryAddress(address[0].id.toString(), box.read('id').toString());
    }
  }

  void getPrimaryAddress() async {
    try {
      final result = await _repo.getPrimaryAddress(box.read('id').toString());
      if (result != null) {
        print('200 pe: ${result.status} : ${result.msg}');
        if (result.status == 200) {
          pinCode.value = result.primaryAddress!.pin_code.toString();
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
}
