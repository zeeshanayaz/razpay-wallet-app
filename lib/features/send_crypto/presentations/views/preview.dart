import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:razpay/core/button.dart';
import 'package:razpay/core/colors.dart';
import 'package:razpay/core/size_boxes.dart';
import 'package:razpay/core/style.dart';
import 'package:razpay/router.dart';
import 'package:razpay/theme.dart';
import 'package:provider/provider.dart';

class SendCryptoPreview extends StatefulWidget {
  const SendCryptoPreview({super.key});

  @override
  State<SendCryptoPreview> createState() => _SendCryptoPreviewState();
}

class _SendCryptoPreviewState extends State<SendCryptoPreview> {
  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<ThemeProvider>(context, listen: true).isDark;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Send Preview',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBoxH15(),
                Text(
                  'Destination',
                  style: textStyle16.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBoxH5(),
                Text(
                  '1FfmbHfnpaZjKFvyi1okTjJJusN455paPH',
                  style: textStyle14,
                ),
                const SizedBoxH25(),
                Container(
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: isDark ? darkGrey : white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: isDark
                        ? []
                        : const [
                            BoxShadow(
                              offset: Offset(1, 5),
                              color: grey,
                              blurRadius: 20,
                              spreadRadius: 0,
                            ),
                            BoxShadow(
                              offset: Offset(5, 1),
                              color: grey,
                              blurRadius: 20,
                              spreadRadius: 0,
                            ),
                          ],
                  ),
                  child: Column(
                    children: [
                      assetDetail(isDark),
                      const SizedBoxH10(),
                      const Divider(),
                      const SizedBoxH10(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Withdrawal Fee',
                            style: textStyle14,
                          ),
                          Text(
                            '0.03 BTC',
                            style: textStyle14.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBoxH10(),
                      const Divider(),
                      const SizedBoxH10(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Amount',
                            style: textStyle14,
                          ),
                          Text(
                            '0.9045 BTC',
                            style: textStyle14.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBoxH10(),
                      const Divider(),
                      const SizedBoxH10(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: textStyle14,
                          ),
                          Text(
                            '\$298.90',
                            style: textStyle14.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    const Icon(Iconsax.lock),
                    const SizedBoxW15(),
                    Expanded(
                      child: Text(
                        'Confirm your Transaction Before clicking on the send button below.',
                        style: textStyle12.copyWith(),
                      ),
                    )
                  ],
                ),
                const SizedBoxH25(),
                CustomButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.sendCryptoPin);
                    // Get.back();
                  },
                  text: 'Confirm & Send',
                ),
                const SizedBoxH20(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget assetDetail(bool isDark) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: isDark ? grey.withOpacity(.2) : grey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(
                'assets/icons/btc.svg',
                width: 30,
                height: 30,
              ),
            ),
            const SizedBoxW10(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bitcoin',
                  style: textStyle16.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'BTC',
                  style: textStyle12,
                ),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '\$567.89',
              style: textStyle16.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '1.23456 BTC',
              style: textStyle12,
            ),
          ],
        ),
      ],
    );
  }
}
