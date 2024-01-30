import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:razpay/core/button.dart';
import 'package:razpay/core/size_boxes.dart';
import 'package:razpay/core/style.dart';
import 'package:razpay/core/text_field.dart';
import 'package:razpay/core/text_field_password.dart';
import 'package:razpay/router.dart';

import '../controller/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginController = Get.put(LoginController());
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back!',
                  style: headerStyle.copyWith(fontSize: 24),
                ),
                Text(
                  'You have been missed',
                  style: textStyle14,
                ),
                Column(
                  children: [
                    const SizedBoxH20(),
                    CustomTextField(controller: loginController.email, hintText: "Email"),
                    const SizedBoxH20(),
                    CustomTextFieldPassword(
                      controller: loginController.password,
                      hintText: "Password",
                      obsecure: hidePassword,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            hidePassword = !hidePassword;
                          });
                        },
                        child: Icon(
                          hidePassword ? IconlyBold.hide : IconlyBold.show,
                        ),
                      ),
                    ),
                    const SizedBoxH20(),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Get.toNamed(AppRoutes.forgotPassword);
                        },
                        child: Text(
                          'Forgot password?',
                          style: textStyle14.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBoxH30(),
                    CustomButton(
                      onPressed: () {
                        loginController.login();
                        // Get.toNamed(AppRoutes.passcode);
                      },
                      text: 'Sign In',
                    ),
                    const SizedBoxH10(),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t have an account?',
                      style: textStyle14,
                    ),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.signUp);
                      },
                      child: Text(
                        'Sign Up',
                        style: textStyle14.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
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
