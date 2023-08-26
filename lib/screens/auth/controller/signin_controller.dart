import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {
  late TextEditingController mobileController;
  var phone = '';
  var userType = '';
  RxBool autoValidate = false.obs;

  @override
  void onInit() {
    super.onInit();
    // email = argumentData[0]['mail'];
    mobileController = TextEditingController();
    // confirmPassController = TextEditingController();
    // emailController.text = email;
  }

  String? validatePhone(String value) {
    if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
      return "Please Enter valid mobile no.";
    }
    return null;
  }
}
