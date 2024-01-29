import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:razpay/core/button.dart';
import 'package:razpay/core/size_boxes.dart';
import 'package:razpay/core/text_field_password.dart';
import 'package:razpay/router.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  TextEditingController password = TextEditingController();
  TextEditingController cpassword = TextEditingController();
  bool showPassword = false;
  bool showCPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Change Password',
        ),
        centerTitle: true,
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
                      controller: password,
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
                      controller: password,
                      hintText: "Confirm Password",
                      obsecure: showCPassword,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            showCPassword = !showCPassword;
                          });
                        },
                        child: Icon(
                          showPassword ? IconlyBold.hide : IconlyBold.show,
                        ),
                      ),
                    ),
                    const SizedBoxH40(),
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
                  text: 'Reset Password',
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
