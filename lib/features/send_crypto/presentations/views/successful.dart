import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razpay/core/button.dart';
import 'package:razpay/core/colors.dart';
import 'package:razpay/core/size_boxes.dart';
import 'package:razpay/core/style.dart';
import 'package:razpay/router.dart';
import 'package:razpay/theme.dart';
import 'package:provider/provider.dart';

class SendCryptoSuccessful extends StatelessWidget {
  const SendCryptoSuccessful({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<ThemeProvider>(context, listen: true).isDark;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBoxH25(),
            Image.asset(
              'assets/images/kyc-successful.png',
            ),
            Column(
              children: [
                Text(
                  'Success!',
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
                  child: const Text('0.65959 BTC'),
                ),
                const SizedBoxH20(),
                const Text(
                  'Has been sent successful',
                ),
              ],
            ),
            Column(
              children: [
                CustomButton(
                  text: 'Done',
                  onPressed: () {
                    Get.offAndToNamed(AppRoutes.mainHome);
                  },
                ),
                const SizedBoxH20(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
