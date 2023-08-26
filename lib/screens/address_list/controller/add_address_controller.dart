import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saket_sweets_app/core/constent.dart';
import 'package:saket_sweets_app/core/repository/repo.dart';
import 'package:saket_sweets_app/core/repository/repo_impl.dart';
import 'package:saket_sweets_app/models/index.dart';

class AddAddressController extends GetxController {
  late TextEditingController mobileController,
      stateController,
      cityController,
      nameController,
      addressController,
      pinController;
  var phone = '';
  var name = '';
  var address = '';
  var pinCode = '';
  var state = '';
  var city = '';
  var stateID = '';
  var response = ''.obs;
  late Repo _repo;
  RxBool isLoading = false.obs;
  String id = '';
  var pinCodeData = PinCodeDetailsData();

  AddAddressController() {
    _repo = Get.find<RepoImpl>();
    id = box.read('id').toString();
    getStateList();
  }

  @override
  void onInit() {
    super.onInit();
    // email = argumentData[0]['mail'];
    mobileController = TextEditingController();
    nameController = TextEditingController();
    addressController = TextEditingController();
    pinController = TextEditingController();
    stateController = TextEditingController();
    cityController = TextEditingController();
    // confirmPassController = TextEditingController();
    // emailController.text = email;
  }

  var addressList = <AddressDetails>[].obs;
  var stateList = <StateListDetails>[].obs;
  var cityList = <String>[].obs;

  getAddAddressResponse(String userID) async {
    isLoading.toggle();
    try {
      final result = await _repo.hitAddAddressApi(
          userID, name, phone, address, pinCode, 'india', state, city);

      if (result != null) {
        if (result.status == 200) {
          addressList.value = result.address;
          Get.offNamed('/addressPage');
        } else if (result.status == 201) {
          print('201');
          dialog();
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

  getStateList() async {
    isLoading.toggle();
    try {
      final result = await _repo.hitStateApi();

      if (result != null) {
        if (result.status == 200) {
          stateList.value = result.detail;
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

  getCityList() async {
    isLoading.toggle();
    try {
      final result = await _repo.hitCityApi(stateID);

      if (result != null) {
        if (result.status == 200) {
          cityList.value = result.detail.city;
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

  getPincodeStatus() async {
    isLoading.toggle();
    try {
      final result = await _repo.getPinCodeStatus(pinCode);

      if (result != null) {
        if (result.status == 200) {
          pinCodeData = result.pincode!;
          getAddAddressResponse(box.read('id').toString());
        } else if (result.status == 201) {
          print('201');
          dialog();
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

  String? validatePhone(String value) {
    if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
      return "Please Enter valid mobile no.";
    }
    return null;
  }

  String? validatePinCode(String value) {
    if (!RegExp(r'^[0-9]{6}$').hasMatch(value)) {
      return "Please Enter valid pin code";
    }
    return null;
  }

  String? validateName(String value) {
    if (RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]').hasMatch(value)) {
      return "Please Enter valid pin code";
    }
    return null;
  }

  String? validateAddress(String value) {
    if (value.isEmpty) {
      return "Please Enter your address";
    }
    return null;
  }

  String? validateState(String value) {
    if (value.isEmpty) {
      return "Select State";
    }
    return null;
  }

  String? validateCity(String value) {
    if (value.isEmpty) {
      return "Select City";
    }
    return null;
  }

  hitApi() {
    getAddAddressResponse(box.read('id').toString());
    // getPincodeStatus();
  }

  dialog() {
    Get.defaultDialog(
      title:
          'We are not providing any services at your location right now. We will reach you soon.',
      titleStyle: const TextStyle(fontWeight: FontWeight.w500),
      content: const SizedBox(
        height: 6,
      ),
      radius: 10.0,
      barrierDismissible: false,
      confirm: ElevatedButton(
        onPressed: () {
          Get.back();
        },
        style: ElevatedButton.styleFrom(
            primary: Colors.teal,
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            textStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        child: const Text(
          'ok',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
        ),
      ),
      // cancel: ElevatedButton(
      //   onPressed: () {
      //     Get.back();
      //     count.value = 1;
      //     Get.offNamed('/askQuery');
      //   },
      //   style: ElevatedButton.styleFrom(
      //       primary: Colors.red,
      //       padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
      //       textStyle:
      //           const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      //   child: const Text(
      //     'No',
      //     style: TextStyle(
      //         color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
      //   ),
      // ),
      // // onConfirm: () => print('yes'),
      // // onCancel: () => print('yes'),
      // cancelTextColor: Colors.black,
    );
  }
}
