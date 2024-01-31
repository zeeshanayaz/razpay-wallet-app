import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razpay/core/button.dart';
import 'package:razpay/core/size_boxes.dart';
import 'package:razpay/core/style.dart';
import 'package:razpay/core/text_field.dart';

import '../controller/forget_password_controller.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final forgetPasswordController = Get.put(ForgetPasswordController());
  
  @override
  Widget build(BuildContext context) {
    // bool isDark = Provider.of<ThemeProvider>(context, listen: true).isDark;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const SizedBoxH20(),
                    Image.asset('assets/images/reset.png'),
                    const SizedBoxH20(),
                    Text(
                      'Reset password',
                      style: headerStyle.copyWith(fontSize: 24),
                    ),
                    const SizedBoxH10(),
                    Text(
                      'Enter an email address you use to sign in to',
                      style: textStyle14,
                    ),
                    const SizedBoxH20(),
                    CustomTextField(
                      controller: forgetPasswordController.email,
                      hintText: 'Email address',
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                CustomButton(
                  onPressed: () {
                    forgetPasswordController.sendOtpForgetPassword();
                  },
                  text: 'Continue',
                ),
                const SizedBoxH20(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
