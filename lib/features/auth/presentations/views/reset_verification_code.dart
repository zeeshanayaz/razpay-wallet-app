import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razpay/core/button.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:razpay/core/colors.dart';
import 'package:razpay/core/size_boxes.dart';
import 'package:razpay/core/style.dart';
import 'package:razpay/router.dart';
import 'package:razpay/theme.dart';

import '../controller/forget_password_controller.dart';

class ResetVerificationScreen extends StatefulWidget {
  const ResetVerificationScreen({super.key});

  @override
  State<ResetVerificationScreen> createState() =>
      _ResetVerificationScreenState();
}

class _ResetVerificationScreenState extends State<ResetVerificationScreen> {
  final forgetPasswordController = Get.find<ForgetPasswordController>();

  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<ThemeProvider>(context, listen: true).isDark;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter Verification Code',
              style: headerStyle.copyWith(fontSize: 24),
            ),
            Text(
              'Enter 4-digit code the we just send to your Email',
              style: textStyle16,
            ),
            const SizedBoxH30(),
            const SizedBoxH30(),
            Center(
              child: Pinput(
                controller: forgetPasswordController.pin,
                obscureText: false,
                keyboardType: TextInputType.number,
                keyboardAppearance: Brightness.light,
                listenForMultipleSmsOnAndroid: true,
                defaultPinTheme: PinTheme(
                  width: 40,
                  height: 40,
                  textStyle: textStyle16.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: white,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: isDark ? darkGrey : grey,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                hapticFeedbackType: HapticFeedbackType.lightImpact,
                length: 4,
                onCompleted: (pin) {
                  Get.toNamed(AppRoutes.createNewPassword);
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
                  width: 40,
                  height: 40,
                  textStyle: textStyle16.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: white,
                  ),
                  decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                submittedPinTheme: PinTheme(
                  width: 40,
                  height: 40,
                  textStyle: textStyle16.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: white,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: isDark ? darkGrey : grey,
                    ),
                  ),
                ),
                errorPinTheme: PinTheme(
                  width: 40,
                  height: 40,
                  textStyle: textStyle16.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: white,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: isDark ? darkGrey : grey,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBoxH20(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Resend code in',
                  style: textStyle14,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    '29:59',
                    style: textStyle14.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBoxH40(),
            // const SizedBoxH30(),
            CustomButton(
              onPressed: () {
                if(forgetPasswordController.pin.text.length == 4) {
                  Get.toNamed(AppRoutes.createNewPassword);
                }
              },
              text: 'Verify',
            ),
          ],
        ),
      ),
    );
  }
}
