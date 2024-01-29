import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razpay/core/button.dart';
import 'package:razpay/core/size_boxes.dart';
import 'package:razpay/core/style.dart';
import 'package:razpay/router.dart';
// import 'package:razpay/theme.dart';
// import 'package:provider/provider.dart';

class KYCDocumentScreen extends StatefulWidget {
  const KYCDocumentScreen({super.key});

  @override
  State<KYCDocumentScreen> createState() => _KYCDocumentScreenState();
}

class _KYCDocumentScreenState extends State<KYCDocumentScreen> {
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
              child: Image.asset(
                'assets/images/doc-scan.png',
              ),
            ),
            Column(
              children: [
                CustomButton(
                  text: 'Next',
                  onPressed: () {
                    Get.toNamed(AppRoutes.kyDocBack);
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
