import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:razpay/core/colors.dart';
import 'package:razpay/core/size_boxes.dart';
import 'package:razpay/core/style.dart';
import 'package:razpay/router.dart';
import 'package:razpay/theme.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  TextEditingController pin = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<ThemeProvider>(context, listen: true).isDark;
    return Scaffold(
      backgroundColor: isDark ? darkbgColor : bgColor,
      // backgroundColor: black,
      appBar: AppBar(
        backgroundColor: isDark ? darkbgColor : bgColor,
        title: const Text(
          'Verification Required',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Please enter your PIN to proceed',
                textAlign: TextAlign.center,
                style: textStyle16,
              ),
              const SizedBoxH30(),
              const SizedBoxH30(),
              Pinput(
                controller: pin,
                obscureText: true,
                keyboardType: TextInputType.number,
                keyboardAppearance: Brightness.light,
                listenForMultipleSmsOnAndroid: true,
                defaultPinTheme: PinTheme(
                  width: 30,
                  height: 30,
                  textStyle: textStyle16.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: white,
                  ),
                  decoration: BoxDecoration(
                    color:
                        isDark ? grey.withOpacity(.3) : const Color(0xff9EA5B1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                hapticFeedbackType: HapticFeedbackType.lightImpact,
                length: 4,
                onCompleted: (pin) {
                  Get.toNamed(AppRoutes.createPin);
                },
                onChanged: (value) {},
                cursor: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 9),
                      width: 22,
                      height: 1,
                      color: primary,
                    ),
                  ],
                ),
                focusedPinTheme: PinTheme(
                  width: 30,
                  height: 30,
                  textStyle: textStyle16.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: white,
                  ),
                  decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                submittedPinTheme: PinTheme(
                  width: 30,
                  height: 30,
                  textStyle: textStyle16.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: white,
                  ),
                  decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                errorPinTheme: PinTheme(
                  width: 30,
                  height: 30,
                  textStyle: textStyle16.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: white,
                  ),
                  decoration: BoxDecoration(
                    color: red,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
