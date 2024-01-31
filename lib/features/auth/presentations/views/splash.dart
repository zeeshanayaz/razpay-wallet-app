import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razpay/core/colors.dart';
import 'package:razpay/core/constant.dart';
import 'package:razpay/core/style.dart';
import 'package:razpay/core/utils/shared_pref.dart';
import 'package:razpay/router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
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
      bool hasLoggedUser = await SharedPref.getBool(kLoggedUser) ?? false;
      if(hasToken.isNotEmpty) {
        if(hasLoggedUser) {
          Get.offAllNamed(AppRoutes.mainHome);
        } else {
          Get.offAndToNamed(AppRoutes.passcode);
        }
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
          Center(
              child: Text(
            'Razpay'.toUpperCase(),
            style: headerStyle.copyWith(
              color: white,
            ),
          )),
        ],
      ),
    );
  }
}
