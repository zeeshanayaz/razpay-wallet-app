import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razpay/core/button.dart';
import 'package:razpay/core/size_boxes.dart';
import 'package:razpay/core/style.dart';

import '../../controllers/kyc_controller.dart';

// import 'package:razpay/theme.dart';
// import 'package:provider/provider.dart';

class KYCDocumentScreen extends StatefulWidget {
  const KYCDocumentScreen({super.key});

  @override
  State<KYCDocumentScreen> createState() => _KYCDocumentScreenState();
}

class _KYCDocumentScreenState extends State<KYCDocumentScreen> {
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
                  'Take a photo of front of your Identity Card',
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
                    kycInformationController.pickImageFrontFromCamera();
                  },
                  child: Obx(
                    () => kycInformationController
                            .imageFileFrontPath.value.isEmpty
                        ? Image.asset(
                            'assets/images/doc-scan.png',
                          )
                        : Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Image.file(
                              File(kycInformationController
                                  .imageFileFrontPath.value),
                              width: double.infinity,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                  )),
            ),
            Column(
              children: [
                CustomButton(
                  text: 'Next',
                  onPressed: () {
                    kycInformationController.navigateToKycBackDoc();
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
