import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:razpay/core/colors.dart';
import 'package:razpay/core/text_field_password.dart';
import 'package:provider/provider.dart';
import 'package:razpay/core/button.dart';
import 'package:razpay/core/size_boxes.dart';
import 'package:razpay/core/style.dart';
import 'package:razpay/core/text_field.dart';
import 'package:razpay/router.dart';
import 'package:razpay/theme.dart';

import '../../../../core/constant.dart';
import '../controller/sign_up_controller.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final signUpController = Get.put(SignUpController());
  bool hidePassword = true;

  @override
  void dispose() {
    Get.delete<SignUpController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<ThemeProvider>(context, listen: true).isDark;
    return Scaffold(
      // backgroundColor: isDark ? darkbgColor : bgColor,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sign Up',
                      style: headerStyle.copyWith(fontSize: 24),
                    ),
                    Text(
                      'It only takes a minute to create your account',
                      style: textStyle14,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  const SizedBoxH20(),
                  CustomTextField(
                    controller: signUpController.firstName,
                    hintText: 'First Name',
                    textCapitalization: TextCapitalization.words,
                  ),
                  const SizedBoxH20(),
                  CustomTextField(
                    controller: signUpController.lastName,
                    hintText: 'Last Name',
                    textCapitalization: TextCapitalization.words,
                  ),
                  const SizedBoxH20(),
                  CustomTextField(
                    controller: signUpController.email,
                    hintText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBoxH20(),
                  CustomTextFieldPassword(
                    controller: signUpController.password,
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
                  CustomTextField(
                    controller: signUpController.country,
                    hintText: 'Country',
                    readOnly: true,
                    textCapitalization: TextCapitalization.words,
                    suffixIcon: IconButton(
                      onPressed: () {
                        showCupertinoModalPopup<void>(
                          context: context,
                          builder: (BuildContext context) => CupertinoActionSheet(
                            title: Text(
                              'Country',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            actions: countryList
                                .map((item) => CupertinoActionSheetAction(
                              child: Text(
                                item,
                                style:
                                Theme.of(context).textTheme.bodySmall,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                                signUpController.country.text = item;
                                // setState(() {});
                              },
                            ))
                                .toList(),
                            cancelButton: CupertinoActionSheetAction(
                              isDefaultAction: true,
                              onPressed: () {
                                Navigator.pop(context, 'Cancel');
                              },
                              child: Text(
                                'Cancel',
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            ),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.arrow_drop_down,
                      ),
                    ),
                  ),
                  const SizedBoxH30(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Checkbox(
                      //   value: agreed,
                      //   checkColor: white,
                      //   activeColor: primary,
                      //   onChanged: (value) {
                      //     setState(() {
                      //       agreed = value!;
                      //     });
                      //   },
                      // ),
                      Obx(() => GestureDetector(
                          onTap: () => signUpController.agreed(!signUpController.agreed.value),
                          child: signUpController.agreed.value
                              ? const Icon(
                            Icons.check_box,
                            color: primary,
                          )
                              : const Icon(Icons.check_box_outline_blank)),),
                      const SizedBoxW10(),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'I agree the razpay ',
                                style: textStyle14.copyWith(
                                  color: isDark ? white : black,
                                ),
                              ),
                              TextSpan(
                                text: 'Terms of Services',
                                style: textStyle14.copyWith(
                                  color: isDark
                                      ? primary
                                      : primary.withOpacity(.6),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: ' and ',
                                style: textStyle14.copyWith(
                                  color: isDark ? white : black,
                                ),
                              ),
                              TextSpan(
                                text: 'Privacy Policy',
                                style: textStyle14.copyWith(
                                  color: isDark
                                      ? primary
                                      : primary.withOpacity(.6),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBoxH30(),
                  CustomButton(
                    onPressed: () {
                      signUpController.register();
                      // Get.toNamed(AppRoutes.createPin);
                    },
                    text: 'Sign Up',
                  ),
                  const SizedBoxH10(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: textStyle14,
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(AppRoutes.login);
                        },
                        child: Text(
                          'Sign in',
                          style: textStyle14.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
