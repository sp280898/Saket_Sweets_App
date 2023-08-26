import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saket_sweets_app/core/style.dart';
import 'package:saket_sweets_app/screens/auth/controller/signin_controller.dart';
import 'package:sms_autofill/sms_autofill.dart';

enum type { select, wholesale, retail }

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final controller = Get.find<SigninController>();
  FocusNode mobileFieldFocusNode = FocusNode();
  type? _character = type.select;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // const BackgroundVideo(),
          Container(
            decoration: const BoxDecoration(
              // shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage('./assets/images/login_bg.jpg'),
                  fit: BoxFit.cover),
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration:
                  BoxDecoration(color: Colors.grey.shade200.withOpacity(0.1)),
            ),
          ),
          Positioned(
            bottom: 0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 200,
                  ),
                  header(),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'I am,',
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Radio<type>(
                            value: type.retail,
                            groupValue: _character,
                            onChanged: (type? value) {
                              setState(() {
                                _character = value;
                                controller.userType = "retail";
                              });
                            },
                          ),
                          const Text('Retail Customer')
                        ],
                      ),
                      Row(
                        children: [
                          Radio<type>(
                            value: type.wholesale,
                            groupValue: _character,
                            onChanged: (type? value) {
                              setState(() {
                                _character = value;
                                controller.userType = "wholesale";
                              });
                            },
                          ),
                          const Text('Whloesale Customer')
                        ],
                      ),

                      // ListTile(
                      //   title: ,
                      //   leading: Radio<type>(
                      //     value: type.wholesale,
                      //     groupValue: _character,
                      //     onChanged: (type? value) {
                      //       setState(() {
                      //         _character = value;
                      //         controller.userType = "wholesale";
                      //       });
                      //     },
                      //   ),
                      // ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        // color: Colors.black.withOpacity(0.2),
                        // color: Colors.amber,
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Form(
                      key: loginFormKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onChanged: () {
                        final isValid = loginFormKey.currentState!.validate();
                        if (isValid) {
                          controller.autoValidate.value = true;
                          final keybordStatus =
                              MediaQuery.of(context).viewInsets.bottom;
                          if (keybordStatus != 0) {
                            FocusScope.of(context).requestFocus(FocusNode());
                          }
                          print(keybordStatus);
                        } else {
                          controller.autoValidate.value = false;
                        }
                      },
                      child: Column(
                        children: [
                          TextFormField(
                            focusNode: mobileFieldFocusNode,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(color: Colors.amber)),
                              border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              errorBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 1)),
                              labelStyle: const TextStyle(color: Colors.black),
                              hintText: "Enter your mobile No.",
                              hintStyle: TextStyle(color: Colors.grey.shade700),
                              // focusedBorder: const OutlineInputBorder(
                              //   borderSide:
                              //       BorderSide(color: Colors.amber, width: 2.0),
                              // ),
                              // enabledBorder: const OutlineInputBorder(
                              //   borderSide:
                              //       BorderSide(color: Colors.black, width: 1.0),
                              // ),
                            ),
                            keyboardType: TextInputType.phone,
                            controller: controller.mobileController,
                            onSaved: (value) {
                              controller.phone = value!;
                              if (kDebugMode) {
                                print('phoneNo: ${value}');
                              }
                            },
                            validator: (value) {
                              return controller.validatePhone(value!);
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          buttonField()
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buttonField() {
    return Obx(
      () {
        return GestureDetector(
          onTap: () async {
            if (controller.autoValidate.isTrue) {
              print('phoneNo: ${controller.mobileController.text}');
              if (controller.userType != "") {
                var appSignature = await SmsAutoFill().getAppSignature;
                Get.offNamed('/otpVerify', arguments: [
                  {
                    'phone': controller.mobileController.text,
                    'userType': controller.userType,
                  }
                ]);
                print("App Signature : $appSignature");
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Please Select your type"),
                ));
              }
            } else {
              FocusScope.of(context).requestFocus(mobileFieldFocusNode);
              print('Do nothing');
            }
          },
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: controller.autoValidate.isTrue
                  ? Theme.of(context).primaryColor
                  : Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Text(
                "Sign In",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
    );
    // Obx(() {
    //   return controller.isLoading.isTrue
    //       ? Row(
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: const [
    //             CircularProgressIndicator(
    //               color: Colors.amber,
    //             )
    //           ],
    //         )
    //       : GestureDetector(
    //           onTap: () {
    //             // Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomePage()));
    //             final isValid = loginFormKey.currentState!.validate();
    //             if (!isValid) {
    //               return;
    //             }
    //             loginFormKey.currentState!.save();
    //             controller.checkLogin();
    //             // obx() {
    //             //   if (controller.userData != null) {

    //             //     Get.toNamed('/home');
    //             //   }
    //             // }
    //           },
    //           child: Container(
    //             height: 50,
    //             decoration: BoxDecoration(
    //               color: Theme.of(context).accentColor,
    //               borderRadius: BorderRadius.circular(10),
    //             ),
    //             child: const Center(
    //               child: Text(
    //                 "Sign In",
    //                 style: TextStyle(
    //                   color: Colors.black,
    //                   fontSize: 15,
    //                   fontWeight: FontWeight.bold,
    //                 ),
    //               ),
    //             ),
    //           ),
    //         );
    // });
  }

  Widget header() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Center(
            child: Text(
                // "Login",style:GoogleFonts.expletusSans(fontStyle: FontStyle.normal,color: Colors.black,fontSize: 40,fontWeight: FontWeight.bold,),
                "Sign In",
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                )),
          ),
          SizedBox(
            height: 5,
          ),
          Center(
            child: Text(
              "Welcome to the Saket Sweets",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
