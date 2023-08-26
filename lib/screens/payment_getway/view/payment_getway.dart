import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:saket_sweets_app/screens/payment_getway/controller/payment_getway_controller.dart';
import 'package:saket_sweets_app/widgets/appBarWidget.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentGetway extends StatefulWidget {
  const PaymentGetway({Key? key}) : super(key: key);

  @override
  State<PaymentGetway> createState() => _PaymentGetwayState();
}

class _PaymentGetwayState extends State<PaymentGetway> {
  late Razorpay _razorpay;
  var userID = '';
  var planID = '';
  var dateTimeStart = '';
  var price = '';
  var route = '';

  @override
  void initState() {
    super.initState();
    userID = Get.arguments[0]['userID'];
    planID = Get.arguments[0]['planID'];
    dateTimeStart = Get.arguments[0]['dateTimeStart'];
    price = Get.arguments[0]['price'];
    route = Get.arguments[0]['route'];

    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

    // openCheckout();
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  final controller = Get.find<PaymentGetwayController>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBarWidget('Payment Details'),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 16, left: 8),
                    child: Text('Name',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    margin: const EdgeInsets.all(8),
                    // padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      // color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          fillColor: Colors.white,
                          filled: true,
                          // labelText: 'Enter Name',
                          hintText: 'Please enter name',
                          hintStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          )),
                      controller: controller.nameController,
                      onSaved: (value) {
                        controller.name = value!;
                      },
                      validator: (value) {
                        return controller.validateName(value!);
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8, left: 8),
                    child: Text('mobile No.',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    margin: const EdgeInsets.all(8),
                    // padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      // color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          fillColor: Colors.white,
                          filled: true,
                          // labelText: 'Enter Name',
                          hintText: 'Please enter mobile no',
                          hintStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          )),
                      maxLength: 10,
                      keyboardType: TextInputType.phone,
                      controller: controller.mobileController,
                      onSaved: (value) {
                        controller.phone = value!;
                      },
                      validator: (value) {
                        return controller.validatePhone(value!);
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8, left: 8),
                    child: Text('Email Id',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    margin: const EdgeInsets.all(8),
                    // padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      // color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          fillColor: Colors.white,
                          filled: true,
                          // labelText: 'Enter Name',
                          hintText: 'Please enter your Address',
                          hintStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          )),
                      keyboardType: TextInputType.emailAddress,
                      controller: controller.emailController,
                      onSaved: (value) {
                        controller.email = value!;
                      },
                      validator: (value) {
                        return controller.validateEmail(value!);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  GestureDetector(
                    onTap: () {
                      final isValid = formKey.currentState!.validate();
                      if (!isValid) {
                        return;
                      }
                      formKey.currentState!.save();
                      openCheckout(
                          controller.nameController.text,
                          controller.mobileController.text,
                          controller.emailController.text);
                      // controller.hitApi(box.read('id').toString());
                    },
                    child: Container(
                      width: double.maxFinite,
                      padding: const EdgeInsets.all(14),
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).primaryColor,
                      ),
                      child: const Text(
                        'Continue',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  void openCheckout(String name, String mobile, String email) {
    var options = {
      'key': 'rzp_test_4zt72PvEEWWAaG',
      'amount': int.parse(price) * 100,
      'name': name,
      'description': 'Laham App',
      'prefill': {'contact': mobile, 'email': email},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      print('Error: e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    if (route == 'cart') {
      controller.hitOrderApi(userID, planID, dateTimeStart, 'paid', 'online',
          response.paymentId.toString(), price, 'Paid Successfuly');
    } else {
      controller.hitSubscriptionApi(userID, planID, dateTimeStart, 'yes',
          'Paid', response.paymentId.toString());
    }
    Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId!,
        toastLength: Toast.LENGTH_SHORT);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    if (route == 'cart') {
      // controller.hitOrderApi(userID, planID, dateTimeStart, 'unpaid', 'online',
      //     response.message.toString(), price, 'something wents wrong');
      Get.offNamed('/home');
    } else {
      controller.hitSubscriptionApi(userID, planID, dateTimeStart, 'no',
          'UnPaid', response.message.toString());
    }
    // Fluttertoast.showToast(
    //     msg: "ERROR: " + response.code.toString() + " - " + response.message!,
    //     toastLength: Toast.LENGTH_SHORT);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName!,
        toastLength: Toast.LENGTH_SHORT);
  }
}
