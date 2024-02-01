import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razpay/core/colors.dart';
import 'package:razpay/core/size_boxes.dart';
import 'package:razpay/core/style.dart';
import 'package:razpay/theme.dart';
import 'package:provider/provider.dart';

import '../../controllers/kyc_controller.dart';

class KYCChooseDocumentScreen extends StatefulWidget {
  const KYCChooseDocumentScreen({super.key});

  @override
  State<KYCChooseDocumentScreen> createState() =>
      _KYCChooseDocumentScreenState();
}

class _KYCChooseDocumentScreenState extends State<KYCChooseDocumentScreen> {
  final kycInformationController = Get.find<KYCInformationController>();

  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<ThemeProvider>(context, listen: true).isDark;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Let’s verify your identity',
              style: headerStyle.copyWith(fontSize: 24),
            ),
            Text(
              'Choose your document to verify your identity',
              style: textStyle14,
            ),
            const SizedBoxH40(),
            Text(
              'Method of Verification'.toUpperCase(),
              style: textStyle18,
            ),
            const SizedBoxH10(),
            docType(
              isDark: isDark,
              title: 'Passport',
              img: 'passport.png',
              onPress: () {
                kycInformationController.navigateToKycDoc('Passport');
              },
            ),
            docType(
              isDark: isDark,
              title: 'Identity Card',
              img: 'id-card.png',
              onPress: () {
                kycInformationController.navigateToKycDoc('Identity Card');
              },
            ),
            docType(
              isDark: isDark,
              title: 'Digital Document',
              img: 'digital-doc.png',
              onPress: () {
                kycInformationController.navigateToKycDoc('Digital Document');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget docType({
    required bool isDark,
    required String title,
    required String img,
    required Function() onPress,
  }) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: isDark ? darkGrey : const Color(0xffF8FAFC),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/icons/$img',
                ),
                const SizedBoxW10(),
                Text(
                  title,
                  style: textStyle16.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios,
            ),
          ],
        ),
      ),
    );
  }
}
