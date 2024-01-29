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
      const Duration(seconds: 5),
      () {
        nextScreen();
      },
    );
    super.initState();
  }

  void nextScreen() async {
    bool firstTime = await SharedPref.getBool(kFirstTime) ?? true;
    if (!firstTime) {
      Get.offAndToNamed(AppRoutes.onboarding);
      // }
    } else {
      Get.offAndToNamed(AppRoutes.onboarding);
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
