import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razpay/core/colors.dart';
import 'package:razpay/core/constant.dart';
import 'package:razpay/core/utils/shared_pref.dart';
import 'package:razpay/router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0.0;

  @override
  void initState() {
    Timer(const Duration(seconds: 1), () {
      setState(() {
        _opacity = 1.0;
      });
    });

    Future.delayed(
      const Duration(seconds: 3),
      () {
        nextScreen();
      },
    );
    super.initState();
  }

  void nextScreen() async {
    bool firstTime = await SharedPref.getBool(kFirstTime) ?? true;
    if (firstTime) {
      Get.offAndToNamed(AppRoutes.onboarding);
      // }
    } else {
      String hasToken = await SharedPref.getString(kToken) ?? '';
      // bool hasLoggedUser = await SharedPref.getBool(kLoggedUser) ?? false;
      if (hasToken.isNotEmpty) {
        // if(hasLoggedUser) {
        //   Get.offAllNamed(AppRoutes.mainHome);
        // } else {
        Get.offAndToNamed(AppRoutes.passcode);
        // }
      } else {
        Get.offAndToNamed(AppRoutes.login);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /*Center(
              child: Text(
            'Razpay'.toUpperCase(),
            style: headerStyle.copyWith(
              color: white,
            ),
          )),*/

          Center(
            child: AnimatedOpacity(
              opacity: _opacity,
              duration: const Duration(seconds: 3),
              // The green box must be a child of the AnimatedOpacity widget.
              child: Image.asset(
                'assets/images/logo.png',
                width: 200,
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}
