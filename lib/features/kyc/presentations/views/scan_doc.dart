import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:provider/provider.dart';
import 'package:razpay/core/button.dart';
import 'package:razpay/core/colors.dart';
import 'package:razpay/core/size_boxes.dart';
import 'package:razpay/core/style.dart';
import 'package:razpay/core/utils/device.dart';
import 'package:razpay/router.dart';
// import 'package:razpay/theme.dart';

class ScanDocumentScreen extends StatefulWidget {
  const ScanDocumentScreen({super.key});

  @override
  State<ScanDocumentScreen> createState() => _ScanDocumentScreenState();
}

class _ScanDocumentScreenState extends State<ScanDocumentScreen> {
  @override
  Widget build(BuildContext context) {
    // bool isDark = Provider.of<ThemeProvider>(context, listen: true).isDark;
    return Scaffold(
      backgroundColor: const Color(0xB2202023),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const BackButton(),
                Text(
                  'Scan Front Side',
                  style: textStyle16.copyWith(
                    color: white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBoxW20(),
              ],
            ),
            Container(
              width: width(context) * .9,
              height: height(context) * .3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: grey.withOpacity(.1),
              ),
              child: Image.asset(
                'assets/images/frame.png',
                width: width(context) * .9,
                height: height(context) * .3,
              ),
            ),
            CustomButton(
              size: width(context) * .5,
              onPressed: () {
                Get.toNamed(AppRoutes.kycCompleted);
              },
              text: 'Scan Now',
            ),
          ],
        ),
      ),
    );
  }
}
