import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:razpay/core/button.dart';
import 'package:razpay/core/size_boxes.dart';
import 'package:razpay/core/style.dart';
import 'package:razpay/core/text_field_password.dart';

import '../../controller/change_password_controller.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final changePasswordController = Get.put(ChangePasswordController());

  bool hidePassword = true;
  bool hideNewPassword = true;
  bool hideCPassword = true;

  @override
  void dispose() {
    Get.delete<ChangePasswordController>();
    super.dispose();
  }

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
                      controller: changePasswordController.password,
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
                      controller: changePasswordController.newPassword,
                      hintText: 'New Password',
                      obsecure: hideNewPassword,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            hideNewPassword = !hideNewPassword;
                          });
                        },
                        child: Icon(
                          hideNewPassword ? IconlyBold.hide : IconlyBold.show,
                        ),
                      ),
                    ),
                    const SizedBoxH20(),
                    CustomTextFieldPassword(
                      controller: changePasswordController.newCPassword,
                      hintText: 'Confirm New Password',
                      obsecure: hideCPassword,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            hideCPassword = !hideCPassword;
                          });
                        },
                        child: Icon(
                          hideCPassword ? IconlyBold.hide : IconlyBold.show,
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
                    changePasswordController.changePassword();
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
