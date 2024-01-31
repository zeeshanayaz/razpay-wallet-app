import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:razpay/core/button.dart';
import 'package:razpay/core/size_boxes.dart';
import 'package:razpay/core/text_field_password.dart';

import '../controller/forget_password_controller.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  final forgetPasswordController = Get.find<ForgetPasswordController>();
  
  bool hidePassword = true;
  bool hideCPassword = true;

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
                      controller: forgetPasswordController.password,
                      hintText: 'Password',
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
                    CustomTextFieldPassword(
                      controller: forgetPasswordController.cpassword,
                      hintText: 'Confirm Password',
                      obsecure: hideCPassword,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            hideCPassword = !hideCPassword;
                          });
                        },
                        child: Icon(
                          hidePassword ? IconlyBold.hide : IconlyBold.show,
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
                    forgetPasswordController.resetPassword();
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
