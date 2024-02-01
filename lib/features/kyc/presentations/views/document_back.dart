import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razpay/core/button.dart';
import 'package:razpay/core/size_boxes.dart';
import 'package:razpay/core/style.dart';

import '../../controllers/kyc_controller.dart';
// import 'package:razpay/theme.dart';
// import 'package:provider/provider.dart';

class KYCDocumentBackScreen extends StatefulWidget {
  const KYCDocumentBackScreen({super.key});

  @override
  State<KYCDocumentBackScreen> createState() => _KYCDocumentBackScreenState();
}

class _KYCDocumentBackScreenState extends State<KYCDocumentBackScreen> {
  final kycInformationController = Get.find<KYCInformationController>();

  @override
  Widget build(BuildContext context) {
    // bool isDark = Provider.of<ThemeProvider>(context, listen: true).isDark;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Verify Account',
                  style: headerStyle.copyWith(fontSize: 24),
                ),
                Text(
                  'Take a photo of back of your Identity Card',
                  style: textStyle14,
                ),
              ],
            ),
            Center(
              child: InkWell(
                customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onTap: () {
                  kycInformationController.pickImageBackFromCamera();
                },
                child: Image.asset(
                  'assets/images/back-card.png',
                ),
              ),
            ),
            Column(
              children: [
                CustomButton(
                  text: 'Next',
                  onPressed: () {
                    kycInformationController.submitKycInformation();
                  },
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
