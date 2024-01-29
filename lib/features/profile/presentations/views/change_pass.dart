import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:razpay/core/button.dart';
import 'package:razpay/core/size_boxes.dart';
import 'package:razpay/core/style.dart';
import 'package:razpay/core/text_field_password.dart';
import 'package:razpay/router.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool showPassword = false;
  bool showNewPassword = false;
  bool showCPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Change Password',
          style: textStyle16.copyWith(fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const SizedBoxH20(),
                    CustomTextFieldPassword(
                      controller: TextEditingController(),
                      hintText: "Password",
                      obsecure: showPassword,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                        child: Icon(
                          showPassword ? IconlyBold.hide : IconlyBold.show,
                        ),
                      ),
                    ),
                    const SizedBoxH20(),
                    CustomTextFieldPassword(
                      controller: TextEditingController(),
                      hintText: "New Password",
                      obsecure: showNewPassword,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            showNewPassword = !showNewPassword;
                          });
                        },
                        child: Icon(
                          showNewPassword ? IconlyBold.hide : IconlyBold.show,
                        ),
                      ),
                    ),
                    const SizedBoxH20(),
                    CustomTextFieldPassword(
                      controller: TextEditingController(),
                      hintText: "Confirm New Password",
                      obsecure: showCPassword,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            showCPassword = !showCPassword;
                          });
                        },
                        child: Icon(
                          showCPassword ? IconlyBold.hide : IconlyBold.show,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                CustomButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.login);
                  },
                  text: 'Change Password',
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
