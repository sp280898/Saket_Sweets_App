import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:saket_sweets_app/core/constent.dart';
import 'package:saket_sweets_app/core/style.dart';
import 'package:saket_sweets_app/screens/profile/controller/profile_controller.dart';
import 'package:saket_sweets_app/services/http_service_impl.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:saket_sweets_app/widgets/appBarWidget.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final controller = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget('Profile'),
      body: Column(
        children: [
          // Container(
          //   height: MediaQuery.of(context).padding.top,
          //   color: Theme.of(context).primaryColor,
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(16.0),
          //   child: Align(
          //     alignment: Alignment.topLeft,
          //     child: GestureDetector(
          //       onTap: () => Get.back(),
          //       child: const Icon(
          //         Icons.arrow_back,
          //         size: 30,
          //       ),
          //     ),
          //   ),
          // ),
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                        image: const AssetImage('./assets/images/bg1.png'),
                        fit: BoxFit.fill,
                        colorFilter:
                            ColorFilter.mode(active, BlendMode.srcIn))),
              ),
              Positioned(
                top: 20,
                child: Obx(() {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 90,
                        width: 90,
                        // margin: const EdgeInsets.only(
                        //     top: 30, left: 16.0, right: 10, bottom: 10),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                width: 3,
                                color: Colors.white,
                                style: BorderStyle.solid),
                            image: box.read('image') != null
                                ? DecorationImage(
                                    image: NetworkImage(BASE_URL +
                                        box.read('image').toString()),
                                    fit: BoxFit.cover)
                                : const DecorationImage(
                                    image: AssetImage(
                                        './assets/images/avatar.png'),
                                    fit: BoxFit.cover)),
                      ),
                      controller.userName.value != ''
                          ? Text(
                              // box.read('name'),
                              controller.userName.toString(),
                              style: GoogleFonts.patuaOne(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w700,
                                  color: white),
                            )
                          : const SizedBox.shrink(),
                      controller.userName.value != ''
                          ? const SizedBox(
                              height: 6,
                            )
                          : const SizedBox.shrink(),
                      // Text(
                      //   // box.read('mail'),
                      //   'Demo@gmail.com',
                      //   style: const TextStyle(
                      //       fontSize: 14,
                      //       // fontWeight: FontWeight.w700,
                      //       color: Colors.black),
                      // ),
                      // const SizedBox(
                      //   height: 3,
                      // ),
                      controller.userMobile.value != ''
                          ? Text(
                              // box.read('mobile'),
                              controller.userMobile.toString(),
                              style: TextStyle(
                                  fontSize: 14,
                                  // fontWeight: FontWeight.w700,
                                  color: white),
                            )
                          : const SizedBox.shrink(),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      TextButton(
                          onPressed: () => Get.toNamed('/editProfile')
                              ?.then((value) => controller.getProfileDetails()),
                          child: Text(
                            'Edit Your Profile',
                            style: TextStyle(
                                color: white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ))
                    ],
                  );
                }),
              ),
            ],
          ),
          Expanded(
              child: Column(
            children: [
              GestureDetector(
                onTap: () => Get.toNamed('/myOrderPage'),
                child: Container(
                  color: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.fact_check,
                        size: 22,
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: Text(
                          'My Orders',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              letterSpacing: 0.6),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 14,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 1,
              ),
              GestureDetector(
                onTap: () => Get.toNamed('/favoritePage'),
                child: Container(
                  color: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.favorite,
                        size: 22,
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: Text(
                          'Favorite List',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              letterSpacing: 0.6),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 14,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 1,
              ),
              GestureDetector(
                onTap: () => Get.toNamed('/addressPage'),
                child: Container(
                  color: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                  child: Row(
                    children: const [
                      Icon(
                        MdiIcons.mapMarker,
                        size: 22,
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: Text(
                          'Saved Addresses',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              letterSpacing: 0.6),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 14,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                color: Colors.white,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                child: Row(
                  children: [
                    const Icon(
                      MdiIcons.logout,
                      size: 22,
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          box.write('isLogedIn', false);
                          box.remove('id');
                          await FirebaseAuth.instance.signOut();
                          Get.offAllNamed('/signIn');
                        },
                        child: const Text(
                          'Logout',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              letterSpacing: 0.6),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 14,
                    ),
                  ],
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
