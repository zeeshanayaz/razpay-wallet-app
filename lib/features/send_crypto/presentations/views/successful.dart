import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razpay/core/button.dart';
import 'package:razpay/core/colors.dart';
import 'package:razpay/core/size_boxes.dart';
import 'package:razpay/core/style.dart';
import 'package:razpay/router.dart';
import 'package:razpay/theme.dart';
import 'package:provider/provider.dart';

class SendCryptoSuccessful extends StatefulWidget {
  const SendCryptoSuccessful({super.key});

  @override
  State<SendCryptoSuccessful> createState() => _SendCryptoSuccessfulState();
}

class _SendCryptoSuccessfulState extends State<SendCryptoSuccessful> {
  String amount = '';
  String status = '';
  String message = '';

  @override
  void initState() {
    final Map<String, dynamic> args = Get.arguments;
    amount = args['amount'];
    status = args['status'];
    message = args['message'];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<ThemeProvider>(context, listen: true).isDark;
    return WillPopScope(
      onWillPop: () async {
        Get.offAllNamed(AppRoutes.mainHome);
        return true;
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBoxH25(),
              status == 'success'
                  ? Image.asset(
                      'assets/images/kyc-successful.png',
                    )
                  : Image.asset(
                      'assets/images/failure.png',
                      width: 200,
                    ),
              Column(
                children: [
                  Text(
                    '$status!',
                    style: headerStyle.copyWith(
                      fontSize: 26,
                    ),
                  ),
                  const SizedBoxH20(),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: isDark ? darkGrey : primary.withOpacity(.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(amount),
                  ),
                  const SizedBoxH20(),
                  Text(
                    message,
                  ),
                ],
              ),
              Column(
                children: [
                  CustomButton(
                    text: 'Done',
                    onPressed: () {
                      Get.offAllNamed(AppRoutes.mainHome);
                    },
                  ),
                  const SizedBoxH20(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
