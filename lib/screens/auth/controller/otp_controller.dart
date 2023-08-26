import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:saket_sweets_app/core/constent.dart';
import 'package:saket_sweets_app/core/repository/repo.dart';
import 'package:saket_sweets_app/core/repository/repo_impl.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OtpController extends GetxController {
  late TextEditingController otpController;
  var otp = '';
  var userType = '';
  RxBool autoValidate = false.obs;
  RxString verificationCode = ''.obs;
  late Repo _repo;
  RxBool isLoading = false.obs;
  var userToken = '';

  OtpController() {
    _repo = Get.find<RepoImpl>();
    userType = Get.arguments[0]['userType'];
  }

  @override
  void onInit() {
    super.onInit();
    // email = argumentData[0]['mail'];
    otpController = TextEditingController();
    // confirmPassController = TextEditingController();
    // emailController.text = email;
  }

  String? validatePhone(String value) {
    if (!RegExp(r'^[0-9]{6}$').hasMatch(value)) {
      return "Please Enter valid OTP.";
    }
    return null;
  }

  verifyPhone(String phone) async {
    isLoading.toggle();
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+91$phone',
      // phoneNumber: '+1$phone',
      // phoneNumber: '+919675703668',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) async {
          if (value.user != null) {
            print('user logged in');
            print('FirebaseAuth :Roy');
            hitLoginApi(phone);
          }
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print('FirebaseAuthException :' + e.message!);
        isLoading.toggle();
      },
      codeSent: (String verificationId, int? resendToken) {
        verificationCode.value = verificationId;
        print('FirebaseAuth codeSent:' + verificationCode.value);
        isLoading.toggle();
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        verificationCode.value = verificationId;
        print(
            'FirebaseAuth codeAutoRetrievalTimeout:' + verificationCode.value);
        // isLoading.toggle();
      },
      timeout: const Duration(seconds: 120),
    );
  }

  hitApi(String phone) {
    verifyPhone(phone);
  }

  hitLoginApi(String phone) async {
    var uid = FirebaseAuth.instance.currentUser!.uid;
    print('UID: $uid');
    isLoading.toggle();
    var token = await getToken();
    print(token);
    try {
      final result = await _repo.hitLoginApi(phone, uid, token, userType);

      if (result != null) {
        if (result.status == 200) {
          box.write('isLogedIn', true);
          box.write('id', result.user!.id);
          box.write('userType', result.user!.user_type);
          Get.offNamed('/dashboard');
        } else if (result.status == 201) {
          print('201');
        } else {
          print('Something went wrong');
        }
      }
    } on Exception catch (e) {
      // TODO
      print("Exception: $e");
    } finally {
      isLoading.toggle();
    }
  }

  Future<String> getToken() async {
    var id = box.read('id');
    var deviceToken = '';
    await FirebaseMessaging.instance.getToken().then((token) {
      userToken = token!;
      deviceToken = token;
      return token;
    });
    return deviceToken;
  }
}
