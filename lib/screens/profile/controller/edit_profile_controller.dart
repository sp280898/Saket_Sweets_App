import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saket_sweets_app/core/constent.dart';
import 'package:saket_sweets_app/core/repository/repo.dart';
import 'package:saket_sweets_app/core/repository/repo_impl.dart';
import 'package:saket_sweets_app/models/index.dart';

class EditProfileController extends GetxController {
  late Repo _repo;
  late TextEditingController nameController, emailController, addressController;

  var name = '';
  var email = '';
  var address = '';
  var userName = '';
  var userMobile = '';
  late File image;

  EditProfileController() {
    _repo = Get.find<RepoImpl>();
    int id = box.read('id');
    getProfileDetails();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    nameController = TextEditingController();
    emailController = TextEditingController();
    addressController = TextEditingController();
    // nameController.text = box.read('name') == null ? '' : box.read('name');
    // emailController.text = box.read('email') == null ? '' : box.read('email');
  }

  UserDetails? userData = UserDetails();
  ProfileDetails? profileData = ProfileDetails();
  RxBool isLoading = false.obs;

  void getProfileDetails() async {
    isLoading.toggle();
    try {
      final result = await _repo.getProfileDetails(box.read('id').toString());
      if (result != null) {
        if (result.status == 200) {
          profileData = result.profile;
          userName = result.profile.name!;
          userMobile = result.profile.mobile!;
          nameController.text = result.profile.name!;
          emailController.text = result.profile.email!;
          addressController.text = result.profile.address!;
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

  void hitUpdateProfile(File image) async {
    isLoading.toggle();
    try {
      final result = await _repo.hitEditProfileApi(
          box.read('id').toString(), name, email, address, image);

      if (result != null) {
        print(result);

        if (result.status == 200) {
          print("home data: $result");
          userData = result.user;
          box.write('name', result.user!.name.toString());
          box.write('email', result.user!.email.toString());
          box.write('phone', result.user!.mobile.toString());
          box.write('image', result.user!.image.toString());
          Get.snackbar(
            "Response",
            "Data Updated Successfully",
            snackPosition: SnackPosition.BOTTOM,
          );
          // Get.back();
          // Get.back();
        } else {
          print(result.msg);
        }
      } else {
        print('No data found');
      }
    } on Exception catch (e) {
      // TODO

    } finally {
      isLoading.toggle();
    }
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

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide valid Email";
    }
    return null;
  }

  hitApi(File image) {
    hitUpdateProfile(image);
  }
}
