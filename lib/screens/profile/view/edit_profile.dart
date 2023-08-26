import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saket_sweets_app/screens/profile/controller/edit_profile_controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  GlobalKey<FormState> editProfileKey = GlobalKey<FormState>();
  final controller = Get.find<EditProfileController>();

  File? image;
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTempory = File(image.path);
      setState(() {
        this.image = imageTempory;
      });
    } on PlatformException catch (e) {
      // TODO
      print('Faild to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // const Text('Hi,',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
              const SizedBox(
                height: 20,
              ),
              Container(
                child: Stack(children: [
                  image != null
                      ? Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(80),
                              border: Border.all(width: 3, color: Colors.white),
                              image: DecorationImage(
                                  image: FileImage(image!), fit: BoxFit.cover)),
                        )
                      : Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(80),
                              border: Border.all(width: 3, color: Colors.white),
                              image: const DecorationImage(
                                  image: AssetImage(
                                    "assets/images/img1.jpg",
                                  ),
                                  fit: BoxFit.cover)),
                        ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () => pickImage(),
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(80),
                          border: Border.all(width: 3, color: Colors.white),
                          // image: const DecorationImage(
                          //     image: AssetImage(
                          //       "assets/images/img.jpg",
                          //     ),
                          //     fit: BoxFit.cover)
                        ),
                        child: const Icon(
                          Icons.add,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
              // Text(
              //   box.read('name'),
              //   style:
              //       const TextStyle(fontSize: 29, fontWeight: FontWeight.bold),
              // ),
              const SizedBox(
                height: 6,
              ),
              const Text(
                'Complete your profile',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey),
              ),
              const SizedBox(
                height: 6,
              ),
              const Divider(
                thickness: 1,
              ),
              Form(
                  key: editProfileKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          labelText: "name",
                          // labelStyle: const TextStyle(color: Colors.black),
                          hintText: "Enter your name",
                          // hintStyle: TextStyle(color: Colors.grey.shade700),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2.0),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.0),
                          ),
                        ),
                        keyboardType: TextInputType.text,
                        controller: controller.nameController,
                        onSaved: (value) {
                          controller.name = value!;
                        },
                        validator: (value) {
                          return controller.validateName(value!);
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          labelText: "Email",
                          hintText: "Enter your email id",
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2.0),
                          ),
                          enabledBorder: const OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.text,
                        controller: controller.emailController,
                        onSaved: (value) {
                          controller.email = value!;
                        },
                        validator: (value) {
                          return controller.validateEmail(value!);
                        },
                      ),
                      // const SizedBox(
                      //   height: 15,
                      // ),
                      // // TextFormField(
                      //   style: const TextStyle(color: Colors.black),
                      //   decoration: InputDecoration(
                      //     labelText: "Address",
                      //     hintText: "Enter your address",
                      //     focusedBorder: OutlineInputBorder(
                      //       borderSide: BorderSide(
                      //           color: Theme.of(context).primaryColor,
                      //           width: 2.0),
                      //     ),
                      //     enabledBorder: const OutlineInputBorder(),
                      //   ),
                      //   keyboardType: TextInputType.multiline,
                      //   maxLength: 180,
                      //   maxLines: 4,
                      //   controller: controller.addressController,
                      //   onSaved: (value) {
                      //     controller.address = value!;
                      //   },
                      //   validator: (value) {
                      //     return controller.validateAddress(value!);
                      //   },
                      // ),
                      const SizedBox(
                        height: 35,
                      ),
                      Obx(() {
                        return controller.isLoading.isTrue
                            ? Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  CircularProgressIndicator(
                                    color: Colors.amber,
                                  )
                                ],
                              )
                            : GestureDetector(
                                onTap: () {
                                  final isValid =
                                      editProfileKey.currentState!.validate();
                                  if (!isValid) {
                                    return;
                                  }
                                  editProfileKey.currentState!.save();
                                  if (image != null) {
                                    controller.hitApi(image!);
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text("Please Select Image"),
                                    ));
                                  }
                                },
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "Save",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                      }),
                      const SizedBox(
                        height: 35,
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  // void _showPopUp(
  //     {required BuildContext context,
  //     required String title,
  //     required List<String> data,
  //     required String fieldAddress}) {
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (_) {
  //         return GestureDetector(
  //             onTap: () {},
  //             behavior: HitTestBehavior.opaque,
  //             child: PopupModelBottomSheet(
  //               title: title,
  //               data: data,
  //               response: _getResponse,
  //               fieldAddress: fieldAddress,
  //             ));
  //       });
  // }
}
