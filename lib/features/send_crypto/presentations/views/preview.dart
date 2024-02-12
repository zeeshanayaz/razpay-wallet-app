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

import '../../../../core/constant.dart';
import '../../../home/controller/wallet_controller.dart';
import '../../controller/send_coin_controller.dart';

class SendCryptoPreview extends StatefulWidget {
  const SendCryptoPreview({super.key});

  @override
  State<SendCryptoPreview> createState() => _SendCryptoPreviewState();
}

class _SendCryptoPreviewState extends State<SendCryptoPreview> {
  final walletController = Get.find<WalletController>();
  final coinController = Get.find<SendCoinController>();

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
                  coinController.addressController.text,
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
                            '${getWithdrawalFee(walletController.selectedWallet.value.currency ?? '')} ${walletController.selectedWallet.value.currency ?? ''}',
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
                            '${coinController.totalAmount()} ${walletController.selectedWallet.value.currency ?? ''}',
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
                            '\$${walletController.selectedWallet.value.usd}',
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
                accessCryptoIcon(walletController.selectedWallet.value.currency ?? ''),
                width: 30,
                height: 30,
              ),
            ),
            const SizedBoxW10(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  accessCryptoName(walletController.selectedWallet.value.currency ?? ''),
                  style: textStyle16.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  walletController.selectedWallet.value.currency ?? '',
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
              '\$${walletController.selectedWallet.value.usd}',
              style: textStyle16.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${coinController.amountController.text} ${walletController.selectedWallet.value.currency}',
              style: textStyle12,
            ),
          ],
        ),
      ],
    );
  }
}
