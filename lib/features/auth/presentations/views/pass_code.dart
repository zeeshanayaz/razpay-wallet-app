import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razpay/core/utils/device.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:razpay/core/colors.dart';
import 'package:razpay/core/size_boxes.dart';
import 'package:razpay/core/style.dart';
import 'package:razpay/theme.dart';

import '../controller/pass_code_controller.dart';

class PasscodeLoginScreen extends StatefulWidget {
  const PasscodeLoginScreen({super.key});

  @override
  State<PasscodeLoginScreen> createState() => _PasscodeLoginScreenState();
}

class _PasscodeLoginScreenState extends State<PasscodeLoginScreen> {
  final passcodeLoginController = Get.put(PasscodeLoginController());
  String pinInput = '';

  @override
  void dispose() {
    Get.delete<PasscodeLoginController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<ThemeProvider>(context, listen: true).isDark;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Welcome Back!',
          style: headerStyle.copyWith(fontSize: 24),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'You have been missed',
                    style: textStyle14,
                  ),
                  const SizedBoxH30(),
                  const SizedBoxH30(),
                  Pinput(
                    controller: passcodeLoginController.pin,
                    obscureText: true,
                    keyboardType: TextInputType.none,
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
                        color: isDark
                            ? grey.withOpacity(.3)
                            : const Color(0xff9EA5B1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    hapticFeedbackType: HapticFeedbackType.lightImpact,
                    length: 4,
                    onCompleted: (pin) {
                      passcodeLoginController.loginWithPassCode();
                    },
                    onChanged: (value) {
                      setState(() {
                        pinInput = value;
                      });
                    },
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
                        color: primary,
                        borderRadius: BorderRadius.circular(10),
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
                        color: red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBoxH40(),
          Container(
            // padding: EdgeInsets.all(16.0),
            alignment: Alignment.center,
            // decoration: const BoxDecoration(
            //     color: white,
            //     borderRadius: BorderRadius.only(
            //         topLeft: Radius.circular(30),
            //         topRight: Radius.circular(30))),
            height: height(context) * .45,
            width: double.infinity,
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.center,
              direction: Axis.horizontal,
              runSpacing: 20,
              spacing: 10,
              children: buttons.map((String button) {
                return InkWell(
                  onTap: () async {
                    if (button == 'del' && pinInput.isNotEmpty) {
                      _handleDelete();
                    } else if (button == '*') {
                    } else {
                      _handleButtonPress(button);
                    }
                  },
                  child: Container(
                    width: width(context) * .3,
                    height: height(context) * .08,
                    padding: const EdgeInsets.all(10),
                    // color: black,
                    alignment: Alignment.center,
                    child: button == 'del'
                        ? const Icon(Icons.backspace_outlined)
                        : Text(
                            button,
                            style: textStyle18.copyWith(
                              fontWeight: FontWeight.w900,
                              fontStyle: FontStyle.italic,
                              fontSize: 20,
                            ),
                          ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  void _handleDelete() {
    String currentText = passcodeLoginController.pin.text;
    if (currentText.isNotEmpty) {
      String updatedText = currentText.substring(0, currentText.length - 1);
      passcodeLoginController.pin.text = updatedText;
    }
  }

  void _handleButtonPress(String button) {
    String currentText = passcodeLoginController.pin.text;
    String updatedText = currentText + button;
    passcodeLoginController.pin.text = updatedText;
  }

  final List<String> buttons = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '*',
    '0',
    'del',
  ];
}
