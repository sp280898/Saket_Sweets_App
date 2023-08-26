import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saket_sweets_app/core/constent.dart';
import 'package:saket_sweets_app/core/repository/repo.dart';
import 'package:saket_sweets_app/core/repository/repo_impl.dart';
import 'package:saket_sweets_app/models/index.dart';

class EditAddressController extends GetxController {
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
  var addressID = '';
  var state = '';
  var city = '';
  var stateID = '';
  var response = ''.obs;
  late Repo _repo;
  RxBool isLoading = false.obs;
  String id = '';

  EditAddressController() {
    _repo = Get.find<RepoImpl>();
    id = box.read('id').toString();
    getStateList();
  }

  @override
  void onInit() {
    super.onInit();
    // email = argumentData[0]['mail'];
    addressID = Get.arguments[0]['id'];
    print('addressID' + addressID);
    mobileController = TextEditingController();
    stateController = TextEditingController();
    cityController = TextEditingController();
    nameController = TextEditingController();
    addressController = TextEditingController();
    pinController = TextEditingController();
    getaddress();
    // confirmPassController = TextEditingController();
    // emailController.text = email;
  }

  var addressList = <AddressDetails>[].obs;
  var stateList = <StateListDetails>[].obs;
  var cityList = <String>[].obs;

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
    // isLoading.toggle();
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
      // isLoading.toggle();
    }
  }

  getAddAddressResponse() async {
    isLoading.toggle();
    try {
      final result = await _repo.hitEditAddressApi(
          addressID, name, phone, address, pinCode, 'india', state, city);

      if (result != null) {
        if (result.status == 200) {
          addressList.value = result.address;
          Get.offNamed('/addressPage');
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

  getaddress() async {
    isLoading.toggle();
    try {
      final result = await _repo.getAddressDetails(addressID);

      if (result != null) {
        if (result.status == 200) {
          nameController.text = result.address.name.toString();
          mobileController.text = result.address.mobile.toString();
          addressController.text = result.address.address.toString();
          pinController.text = result.address.pin_code.toString();
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
    getAddAddressResponse();
  }
}
