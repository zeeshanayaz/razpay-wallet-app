import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:razpay/core/divider.dart';
import 'package:razpay/core/size_boxes.dart';
import 'package:razpay/core/style.dart';
import 'package:razpay/features/home/presentations/widgets/trending_tile.dart';
// import 'package:razpay/features/market/presentations/widgets/market_cap.dart';
import 'package:razpay/router.dart';
import 'package:razpay/theme.dart';
import 'package:provider/provider.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({super.key});

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<ThemeProvider>(context, listen: true).isDark;
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBoxW5(),
        leadingWidth: 0,
        centerTitle: false,
        title: const Text(
          'Market',
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.notifications);
            },
            child: const Icon(
              Iconsax.notification,
            ),
          ),
          const SizedBoxW15(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     MarketCapWid(
            //       title: 'Market Cap',
            //       price: '\$2.5B',
            //       rate: '+5.15%',
            //       increasing: true,
            //     ),
            //     MarketCapWid(
            //       title: '24th Volume',
            //       price: '\$215B',
            //       rate: '+1.15%',
            //       increasing: true,
            //     ),
            //     MarketCapWid(
            //       title: 'Dominance',
            //       price: '60%',
            //       rate: '+1.15%',
            //       increasing: true,
            //     ),
            //   ],
            // ),
            // const SizedBoxH20(),
            Text(
              'Live Prices',
              style: textStyle16.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBoxH15(),
            const TrendingTile(
              name: 'Litecoin',
              asset: 'LTC',
              icon: 'ltc',
              value: '\$20,000',
              goingUp: false,
              increasePer: '2.6%',
            ),
            const SizedBoxH5(),
            LineDivider(
              isDark: isDark,
            ),
            const SizedBoxH5(),
            const TrendingTile(
              name: 'Binance',
              asset: 'BNB',
              icon: 'binance',
              value: '\$20,000',
              goingUp: true,
              increasePer: '2.6%',
            ),
            const SizedBoxH5(),
            LineDivider(
              isDark: isDark,
            ),
            const SizedBoxH5(),
            const TrendingTile(
              name: 'Ethereum',
              asset: 'ETH',
              icon: 'eth',
              value: '\$20,000',
              goingUp: true,
              increasePer: '2.6%',
            ),
            const SizedBoxH5(),
            LineDivider(
              isDark: isDark,
            ),
            const SizedBoxH5(),
            const TrendingTile(
              name: 'Bitcoin',
              asset: 'BTC',
              icon: 'btc',
              value: '\$20,000',
              goingUp: true,
              increasePer: '2.6%',
            ),
            const SizedBoxH40(),
          ],
        ),
      ),
    );
  }
}
