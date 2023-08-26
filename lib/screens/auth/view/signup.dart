import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
            // color: Theme.of(context).primaryColor.withOpacity(0.7),
            color: Colors.white),
        child: Theme(
          data: Theme.of(context).copyWith(
              unselectedWidgetColor: Colors.black, disabledColor: Colors.blue),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).padding.top,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    // padding: const EdgeInsets.symmetric(horizontal: 8),
                    alignment: Alignment.topLeft,
                    width: double.infinity,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Center(
                                child: Text(
                                    // "Login",style:GoogleFonts.expletusSans(fontStyle: FontStyle.normal,color: Colors.black,fontSize: 40,fontWeight: FontWeight.bold,),
                                    "Sign Up",
                                    style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      color: Colors.black,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Center(
                                child: Text(
                                  "Welcome to the Saket Sweets",
                                  style: TextStyle(
                                    color: Colors.grey.shade500,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Form(
                          key: signupFormKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    const SizedBox(height: 20),
                                    TextFormField(
                                      style:
                                          const TextStyle(color: Colors.black),
                                      decoration: InputDecoration(
                                        labelText: "Name",
                                        labelStyle: const TextStyle(
                                            color: Colors.black),
                                        hintText: "Enter your Name",
                                        hintStyle: const TextStyle(
                                            color: Colors.black),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color:
                                                  Theme.of(context).canvasColor,
                                              width: 2.0),
                                        ),
                                        enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 1.0),
                                        ),
                                      ),
                                      keyboardType: TextInputType.text,
                                      // controller: controller.nameController,
                                      // onSaved: (value) {
                                      //   controller.name = value!;
                                      // },
                                      // validator: (value) {
                                      //   return controller.validateName(value!);
                                      // },
                                    ),
                                    const SizedBox(height: 20),
                                    TextFormField(
                                      style:
                                          const TextStyle(color: Colors.black),
                                      decoration: InputDecoration(
                                        labelText: "Email",
                                        labelStyle: const TextStyle(
                                            color: Colors.black),
                                        hintText: "Enter your Email",
                                        hintStyle: const TextStyle(
                                            color: Colors.black),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color:
                                                  Theme.of(context).canvasColor,
                                              width: 2.0),
                                        ),
                                        enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 1.0),
                                        ),
                                      ),
                                      keyboardType: TextInputType.emailAddress,
                                      // controller: controller.emailController,
                                      // onSaved: (value) {
                                      //   controller.email = value!;
                                      // },
                                      // validator: (value) {
                                      //   return controller.validateEmail(value!);
                                      // },
                                    ),
                                    const SizedBox(height: 20),
                                    TextFormField(
                                      style:
                                          const TextStyle(color: Colors.black),
                                      decoration: InputDecoration(
                                        labelText: "Mobile No",
                                        labelStyle: const TextStyle(
                                            color: Colors.black),
                                        hintText: "Enter your Mobile No",
                                        hintStyle: const TextStyle(
                                            color: Colors.black),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color:
                                                  Theme.of(context).canvasColor,
                                              width: 2.0),
                                        ),
                                        enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 1.0),
                                        ),
                                      ),
                                      keyboardType: TextInputType.phone,
                                      // controller: controller.mobileController,
                                      // onSaved: (value) {
                                      //   controller.phone = value!;
                                      // },
                                      // validator: (value) {
                                      //   return controller.validatePhone(value!);
                                      // },
                                    ),
                                    const SizedBox(height: 20),
                                    // const SizedBox(
                                    //   width: double.infinity,
                                    //   child: Text(
                                    //     'Select Gender',
                                    //     style: TextStyle(color: Colors.black),
                                    //   ),
                                    // ),
                                    // const SizedBox(height: 20),
                                    // Column(
                                    //   children: [
                                    //     Row(
                                    //       children: [
                                    //         Expanded(
                                    //             child: Row(
                                    //           children: [
                                    //             Radio<Gender>(
                                    //               value: Gender.female,
                                    //               groupValue: _gender,
                                    //               onChanged: (Gender? value) {
                                    //                 setState(() {
                                    //                   _gender = value;
                                    //                   gen = "female";
                                    //                 });
                                    //               },
                                    //             ),
                                    //             const Text(
                                    //               'Female',
                                    //               style: TextStyle(
                                    //                   color: Colors.black),
                                    //             )
                                    //           ],
                                    //         )),
                                    //         Expanded(
                                    //             child: Row(
                                    //           children: [
                                    //             Radio<Gender>(
                                    //               value: Gender.male,
                                    //               groupValue: _gender,
                                    //               onChanged: (Gender? value) {
                                    //                 setState(() {
                                    //                   _gender = value;
                                    //                   gen = "male";
                                    //                 });
                                    //               },
                                    //             ),
                                    //             const Text(
                                    //               'Male',
                                    //               style: TextStyle(
                                    //                   color: Colors.black),
                                    //             )
                                    //           ],
                                    //         )),
                                    //       ],
                                    //     ),
                                    //   ],
                                    // ),
                                    // const SizedBox(height: 20),
                                    TextFormField(
                                      style:
                                          const TextStyle(color: Colors.black),
                                      decoration: InputDecoration(
                                        labelText: "Password",
                                        labelStyle: const TextStyle(
                                            color: Colors.black),
                                        hintText: "Enter your Password",
                                        hintStyle: const TextStyle(
                                            color: Colors.black),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color:
                                                  Theme.of(context).canvasColor,
                                              width: 2.0),
                                        ),
                                        enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 1.0),
                                        ),
                                      ),
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      // controller: controller.passController,
                                      // onSaved: (value) {
                                      //   controller.pass = value!;
                                      // },
                                      // validator: (value) {
                                      //   return controller
                                      //       .validatePassword(value!);
                                      // },
                                    ),
                                    const SizedBox(height: 20),
                                    TextFormField(
                                      style:
                                          const TextStyle(color: Colors.black),
                                      decoration: InputDecoration(
                                        labelText: "Confirm Password",
                                        labelStyle: const TextStyle(
                                            color: Colors.black),
                                        hintText: "Confirm your Password",
                                        hintStyle:
                                            const TextStyle(color: Colors.grey),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color:
                                                  Theme.of(context).canvasColor,
                                              width: 2.0),
                                        ),
                                        enabledBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 1.0),
                                        ),
                                      ),
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      // controller:
                                      //     controller.confirmPassController,
                                      // onSaved: (value) {
                                      //   controller.confirmPass = value!;
                                      // },
                                      // validator: (value) {
                                      //   return controller
                                      //       .validateconfirmPassword(value!);
                                      // },
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              buttonField(),
                              // Container(
                              //   height: 50,
                              //   decoration: BoxDecoration(
                              //     color: Theme.of(context).accentColor,
                              //     borderRadius: BorderRadius.circular(10),
                              //   ),
                              //   child: const Center(
                              //     child: Text(
                              //       "Sign Up",
                              //       style: TextStyle(
                              //         color: Colors.black,
                              //         fontSize: 15,
                              //         fontWeight: FontWeight.bold,
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              // Container(
                              //   padding:
                              //       const EdgeInsets.symmetric(vertical: 5),
                              //   width: double.infinity,
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.center,
                              //     children: [
                              //       Checkbox(
                              //         value: this.value,
                              //         onChanged: (value) {
                              //           setState(() {
                              //             this.value = value!;
                              //           });
                              //         },
                              //       ),
                              //       const Text(
                              //         "*Terms & Conditions apply",
                              //         style: TextStyle(fontSize: 12),
                              //         textAlign: TextAlign.center,
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                width: double.infinity,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      text: "Already have account?",
                                      style: TextStyle(
                                        color: Colors.grey[900],
                                      ),
                                      children: [
                                        TextSpan(
                                          text: " Sign In",
                                          style: TextStyle(
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )

              // Center(
              //   child: GestureDetector(
              //     onTap: (){
              //       Navigator.pop(context);
              //     },
              //     child: Text("Back")),
              // )
            ],
          ),
        ),
      ),
    );
  }

  Widget buttonField() {
    return GestureDetector(
      onTap: () => Get.toNamed('/signIn'),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Center(
          child: Text(
            "Sign Up",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
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
    //             if (value) {
    //               final isValid = signupFormKey.currentState!.validate();
    //               if (!isValid) {
    //                 return;
    //               }
    //               signupFormKey.currentState!.save();
    //               controller.checkRegister(gen);
    //             } else {
    //               ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    //                 content: Text("Please Accept Term & Condition"),
    //               ));
    //             }
    //             // controller.checkRegister(gen);
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
    //                 "Sign Up",
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
}
