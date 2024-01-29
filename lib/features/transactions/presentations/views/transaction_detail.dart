import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:razpay/core/button.dart';
import 'package:razpay/core/colors.dart';
import 'package:razpay/core/divider.dart';
import 'package:razpay/core/size_boxes.dart';
import 'package:razpay/core/style.dart';
// import 'package:razpay/router.dart';
import 'package:razpay/theme.dart';
import 'package:provider/provider.dart';

class TransactionDetail extends StatefulWidget {
  const TransactionDetail({super.key});

  @override
  State<TransactionDetail> createState() => _TransactionDetailState();
}

class _TransactionDetailState extends State<TransactionDetail> {
  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<ThemeProvider>(context, listen: true).isDark;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Transaction Details',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const SizedBoxH20(),
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
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
                      const SizedBoxH25(),
                      assetDetail(isDark),
                      const SizedBoxH10(),
                      LineDivider(
                        isDark: isDark,
                      ),
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
                      LineDivider(
                        isDark: isDark,
                      ),
                      const SizedBoxH10(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Status',
                            style: textStyle14,
                          ),
                          Text(
                            'Confirmed',
                            style: textStyle14.copyWith(
                              fontWeight: FontWeight.bold,
                              color: green,
                            ),
                          ),
                        ],
                      ),
                      const SizedBoxH10(),
                      LineDivider(
                        isDark: isDark,
                      ),
                      const SizedBoxH10(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Timestamp',
                            style: textStyle14,
                          ),
                          Text(
                            '17 Dec, 2023\n12:00PM',
                            style: textStyle14.copyWith(
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      const SizedBoxH10(),
                      LineDivider(
                        isDark: isDark,
                      ),
                      const SizedBoxH10(),
                      Text(
                        'Recipient Address',
                        style: textStyle16.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBoxH5(),
                      Text(
                        '1FfmbHfnpaZjKFvyi1okTjJJusN455paPH',
                        style: textStyle14,
                      ),
                      const SizedBoxH15(),
                      Text(
                        'Transaction ID',
                        style: textStyle16.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBoxH5(),
                      Text(
                        '42be1f24024a3f016e0b9290d367b196778a3dac8cdfc871bfd428b412cbcaaa',
                        style: textStyle14,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: -20,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: green,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      IconlyBold.arrow_down_square,
                      color: white,
                    ),
                  ),
                  // child: Image.asset(
                  //   'assets/icons/confirmed.png',
                  // ),
                ),
              ],
            ),
            const SizedBoxH25(),
            CustomButton(
              onPressed: () {
                // Get.offAndToNamed(AppRoutes.mainHome);
                Get.back();
              },
              text: 'Back to Portfolio',
            )
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
