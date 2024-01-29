import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:razpay/core/colors.dart';
import 'package:razpay/core/size_boxes.dart';
import 'package:razpay/core/style.dart';
import 'package:razpay/core/utils/device.dart';
// import 'package:razpay/theme.dart';
// import 'package:provider/provider.dart';

class ReceiveCryptoModal extends StatefulWidget {
  const ReceiveCryptoModal({super.key});

  @override
  State<ReceiveCryptoModal> createState() => _ReceiveCryptoModalState();
}

class _ReceiveCryptoModalState extends State<ReceiveCryptoModal> {
  String selectedCoin = 'Bitcoin';
  List<String> coins = ['Bitcoin', 'Ethereum', 'Tether'];
  @override
  Widget build(BuildContext context) {
    // bool isDark = Provider.of<ThemeProvider>(context, listen: true).isDark;
    return SizedBox(
      // color: isDark ? darkbgColor : white,
      width: width(context),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBoxH20(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (var item in coins) coinWid(name: item),
              ],
            ),
          ),
          const SizedBoxH20(),
          Image.asset(
            'assets/icons/qrcode.png',
          ),
          const SizedBoxH20(),
          Text(
            '1GN5KjC4aGKDcEqwe7a5gNZFVqP86jjLBf',
            style: textStyle14,
          ),
          const SizedBoxH20(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
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
              const SizedBoxW30(),
              Row(
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
              )
            ],
          ),
          const SizedBoxH30(),
        ],
      ),
    );
  }

  Widget coinWid({required String name}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCoin = name;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.only(left: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: name == selectedCoin ? primary : grey),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              name == 'Bitcoin'
                  ? 'assets/icons/btc.svg'
                  : name == 'Ethereum'
                      ? 'assets/icons/eth.svg'
                      : 'assets/icons/binance.svg',
              width: 20,
              height: 20,
            ),
            const SizedBoxW5(),
            Text(
              name,
              style: textStyle12,
            ),
          ],
        ),
      ),
    );
  }
}
