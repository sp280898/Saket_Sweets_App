import 'dart:async';

import 'package:flutter/material.dart';
import 'package:saket_sweets_app/core/constent.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saket_sweets_app/core/style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    box.writeIfNull('isLogedIn', false);

    Timer(const Duration(seconds: 1), () {
      checkifLogedIn();
    });
  }

  @override
  Widget build(BuildContext context) {
    final Shader linearGradient = const LinearGradient(
      colors: <Color>[
        Color.fromARGB(255, 255, 38, 0),
        Color.fromARGB(255, 255, 0, 119)
      ],
    ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

    return Scaffold(
      backgroundColor: white,
      body: Stack(
        // fit: StackFit.expand,
        children: [
          // Container(
          //   decoration: BoxDecoration(
          //     gradient: LinearGradient(
          //       colors: [Colors.blue.shade400, Colors.blue.shade800],
          //       begin: Alignment.bottomCenter,
          //       end: Alignment.topCenter,
          //     ),
          //   ),
          // ),
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage('./assets/images/saket_logo.png'),
                  width: 300,
                  height: 300,
                ),
                // const SizedBox(
                //   height: 5,
                // ),
                // Text(
                //   "Saket Sweets",
                //   style: GoogleFonts.greatVibes(
                //     fontSize: 50,
                //     letterSpacing: 1.5,
                //     wordSpacing: 6.0,
                //     fontWeight: FontWeight.bold,
                //     foreground: Paint()..shader = linearGradient,
                //   ),
                //   // style: TextStyle(
                //   //   fontSize: 40,
                //   //   fontWeight: FontWeight.bold,
                //   //   foreground: Paint()..shader = linearGradient,
                //   // ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void checkifLogedIn() {
    // Get.offAllNamed('/dashboard');
    (box.read('isLogedIn'))
        ? Get.offAllNamed('/dashboard')
        : Get.offAllNamed('/signIn');
  }
}
