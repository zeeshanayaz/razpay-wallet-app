import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:razpay/core/colors.dart';
import 'package:razpay/core/size_boxes.dart';
import 'package:razpay/core/style.dart';
import 'package:razpay/core/utils/device.dart';

import '../../../../core/constant.dart';
import '../../../../core/dialog.dart';
import '../../../../models/wallet/wallet.dart';
import '../../controller/wallet_controller.dart';
// import 'package:razpay/theme.dart';
// import 'package:provider/provider.dart';

class ReceiveCryptoModal extends StatefulWidget {
  const ReceiveCryptoModal({super.key});

  @override
  State<ReceiveCryptoModal> createState() => _ReceiveCryptoModalState();
}

class _ReceiveCryptoModalState extends State<ReceiveCryptoModal> {
  final walletController = Get.put(WalletController());

  @override
  void dispose() {
    Get.delete<WalletController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // bool isDark = Provider.of<ThemeProvider>(context, listen: true).isDark;
    return SizedBox(
      // color: isDark ? darkbgColor : white,
      width: width(context),
      child: Obx(() => Column(
        mainAxisSize: MainAxisSize.min,
        children: walletController.isLoading.isTrue
            ? [
          const SizedBoxH20(),
              DialogHelper.loadingIndicator(),
          const SizedBoxH20(),
        ]
            : [
          const SizedBoxH20(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (var item in walletController.wallet) coinWid(wallet: item),
              ],
            ),
          ),
          const SizedBoxH20(),
          Image.asset(
            'assets/icons/qrcode.png',
          ),
          const SizedBoxH20(),
          Text(
            walletController.selectedWallet.value.address ?? '',
            style: textStyle14,
          ),
          const SizedBoxH20(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () => walletController.copyAddressToClipboard(),
                child: Row(
                  children: [
                    const Icon(
                      Icons.copy,
                    ),
                    const SizedBoxW5(),
                    Text(
                      'Copy',
                      style: textStyle14,
                    ),
                  ],
                ),
              ),
              const SizedBoxW30(),
              InkWell(
                onTap: () => walletController.shareAddress(),
                child: Row(
                  children: [
                    const Icon(
                      Icons.share_rounded,
                    ),
                    const SizedBoxW5(),
                    Text(
                      'Share',
                      style: textStyle14,
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBoxH30(),
        ],
      ),),
    );
  }

  Widget coinWid({required WalletAddress wallet}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          walletController.selectedWallet(wallet);
        });
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.only(left: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: wallet.id == walletController.selectedWallet.value.id ? primary : grey),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              accessCryptoIcon(wallet.currency ?? ''),
              width: 20,
              height: 20,
            ),
            const SizedBoxW5(),
            Text(
              accessCryptoName(wallet.currency ?? ''),
              style: textStyle12,
            ),
          ],
        ),
      ),
    );
  }
}
