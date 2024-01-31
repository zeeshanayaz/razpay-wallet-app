import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razpay/core/button.dart';
import 'package:razpay/core/size_boxes.dart';
import 'package:razpay/core/style.dart';
import 'package:razpay/router.dart';

class KYCSuccessfulScreen extends StatefulWidget {
  const KYCSuccessfulScreen({super.key});

  @override
  State<KYCSuccessfulScreen> createState() => _KYCSuccessfulScreenState();
}

class _KYCSuccessfulScreenState extends State<KYCSuccessfulScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBoxH20(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/kyc-successful.png',
                    ),
                  ),
                  const SizedBoxH20(),
                  Text(
                    'Document Submited',
                    style: headerStyle.copyWith(fontSize: 24),
                  ),
                  const SizedBoxH10(),
                  Text(
                    'Your KYC Documents has been submitted \nSuccessfully',
                    style: textStyle14,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBoxH20(),
              Column(
                children: [
                  CustomButton(
                    onPressed: () {
                      Get.offAllNamed(AppRoutes.mainHome);
                    },
                    text: 'Proceed to Portfolio',
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
