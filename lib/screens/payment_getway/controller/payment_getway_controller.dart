import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saket_sweets_app/core/constent.dart';
import 'package:saket_sweets_app/core/repository/repo.dart';
import 'package:saket_sweets_app/core/repository/repo_impl.dart';
import 'package:saket_sweets_app/models/index.dart';

class PaymentGetwayController extends GetxController {
  late TextEditingController mobileController,
      nameController,
      emailController,
      pinController;
  var phone = '';
  var name = '';
  var email = '';
  var address = '';
  var pinCode = '';
  var state = '';
  late Repo _repo;
  RxBool isLoading = false.obs;
  String id = '';

  PaymentGetwayController() {
    _repo = Get.find<RepoImpl>();
    id = box.read('id').toString();
    getProfileDetails();
    getAddressDetails();
  }

  @override
  void onInit() {
    super.onInit();
    // email = argumentData[0]['mail'];
    mobileController = TextEditingController();
    nameController = TextEditingController();
    emailController = TextEditingController();
    pinController = TextEditingController();
    // confirmPassController = TextEditingController();
    // emailController.text = email;
  }

  var subscriptionList = <SubscriptionDetails>[].obs;
  var orderList = <OrderDetails>[].obs;
  ProfileDetails? profileData = ProfileDetails();

  void getProfileDetails() async {
    isLoading.toggle();
    try {
      final result = await _repo.getProfileDetails(box.read('id').toString());
      if (result != null) {
        if (result.status == 200) {
          profileData = result.profile;
          nameController.text = result.profile.name!;
          mobileController.text = result.profile.mobile!;
          emailController.text = result.profile.email!;
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

  void getAddressDetails() async {
    isLoading.toggle();
    try {
      final result = await _repo.getPrimaryAddress(box.read('id').toString());
      if (result != null) {
        if (result.status == 200) {
          address = result.primaryAddress!.address.toString();
          pinCode = result.primaryAddress!.pin_code.toString();
          state = result.primaryAddress!.state.toString();
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

  hitSubscriptionApi(
    String userID,
    String planID,
    String planStart,
    String paidStatus,
    String paymentType,
    String paymentID,
  ) async {
    isLoading.toggle();
    try {
      final result = await _repo.hitSubscriptionApi(userID, '', planID,
          planStart, '', paidStatus, 'yes', '', '', paymentType, paymentID);

      if (result != null) {
        if (result.status == 200) {
          subscriptionList.value = result.sublist;
          Get.offNamed('/mySubscription');
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

  hitOrderApi(
    String userID,
    String address,
    String orderDateTime,
    String paidStatus,
    String paymentType,
    String paymentID,
    String price,
    String comment,
  ) async {
    isLoading.toggle();
    try {
      final result = await _repo.hitOrderApi(
        userID,
        '',
        orderDateTime,
        '',
        paidStatus,
        address,
        '',
        price,
        comment,
        paymentType,
        paymentID,
        address,
        state,
        pinCode,
      );

      if (result != null) {
        if (result.status == 200) {
          orderList.value = result.order;
          Get.offNamed('/myOrderPage');
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

  String? validateName(String value) {
    if (RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]').hasMatch(value)) {
      return "Please Enter valid pin code";
    }
    return null;
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide valid Email";
    }
    return null;
  }
}
