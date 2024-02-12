import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razpay/core/button.dart';
import 'package:razpay/core/size_boxes.dart';
import 'package:razpay/core/style.dart';
import 'package:razpay/core/text_field.dart';
import 'package:razpay/router.dart';

import '../../../home/controller/wallet_controller.dart';
import '../../controller/send_coin_controller.dart';

class SendCryptoAddress extends StatefulWidget {
  const SendCryptoAddress({super.key});

  @override
  State<SendCryptoAddress> createState() => _SendCryptoAddressState();
}

class _SendCryptoAddressState extends State<SendCryptoAddress> {
  final walletController = Get.find<WalletController>();
  final coinController = Get.find<SendCoinController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Send Crypto',
        ),
      ),
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
                  'Wallet Address',
                  style: headerStyle.copyWith(fontSize: 24),
                ),
                Text(
                  'Enter Recipient wallet address below',
                  textAlign: TextAlign.center,
                  style: textStyle16,
                ),
                const SizedBoxH20(),
                CustomTextField(
                  controller: coinController.addressController,
                  hintText: 'Enter Recipient wallet address',
                ),
              ],
            ),
            Column(
              children: [
                CustomButton(
                  onPressed: () {
                    if(coinController.addressController.text.isNotEmpty) {
                      Get.toNamed(AppRoutes.sendCryptoPreview);
                    }
                  },
                  text: 'Send ${walletController.selectedWallet.value.currency}',
                ),
                const SizedBoxH15(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
