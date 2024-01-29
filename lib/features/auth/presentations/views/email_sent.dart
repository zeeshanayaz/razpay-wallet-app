import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:razpay/core/button.dart';
import 'package:razpay/core/colors.dart';
import 'package:razpay/core/size_boxes.dart';
import 'package:razpay/core/style.dart';
import 'package:razpay/router.dart';
import 'package:razpay/theme.dart';

class EmailSentScreen extends StatefulWidget {
  const EmailSentScreen({super.key});

  @override
  State<EmailSentScreen> createState() => _EmailSentScreenState();
}

class _EmailSentScreenState extends State<EmailSentScreen> {
  TextEditingController pin = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<ThemeProvider>(context, listen: true).isDark;
    return Scaffold(
      backgroundColor: isDark ? darkbgColor : bgColor,
      appBar: AppBar(
        backgroundColor: isDark ? darkbgColor : bgColor,
        title: const Text(
          'Check Your Email',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Follow a password recovery instructions we have just sent to your email address ',
                textAlign: TextAlign.center,
                style: textStyle16,
              ),
              Image.asset('assets/images/email_sent.png'),
              Column(
                children: [
                  CustomButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.createNewPassword);
                    },
                    text: 'Back to Login',
                  ),
                  const SizedBoxH20(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
