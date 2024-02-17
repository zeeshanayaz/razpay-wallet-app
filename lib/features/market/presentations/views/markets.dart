import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;
import 'package:iconsax/iconsax.dart';
import 'package:razpay/core/size_boxes.dart';
import 'package:razpay/core/style.dart';
import 'package:razpay/features/home/presentations/widgets/trending_tile.dart';
// import 'package:razpay/features/market/presentations/widgets/market_cap.dart';
import 'package:razpay/router.dart';

import '../../../../core/dialog.dart';
import '../../../../core/helper.dart';
import '../../../notifications/controllers/notification_controller.dart';
import '../../controllers/market_controller.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({super.key});

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  final marketController = Get.put(MarketController());
  final notificationController = Get.find<NotificationController>();

  @override
  void dispose() {
    Get.delete<MarketController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            child: badges.Badge(
              badgeContent: Obx(() => Text('${notificationController.badgeCount.value}'),),
              child: const Icon(
                Iconsax.notification,
              ),
            ),
          ),
          const SizedBoxW15(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Obx(() => Column(
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

            marketController.isLoadingMarket.isTrue
                ? DialogHelper.loadingIndicator()
                : Expanded(child: ListView.builder(
              itemCount: marketController.market.length, // Replace this with your desired item count
              itemBuilder: (context, index) {
                var marketData = marketController.market[index];
                // Replace this with your list item widget
                return TrendingTile(
                  marketData: marketController.market[index],
                  name: marketData.currency ?? '',
                  asset: marketData.currency ?? '',
                  icon: marketData.icon ?? '',
                  value: '\$${BaseHelper.formatStringToDecimal(marketData.usdValue ?? '0.0')}',
                  goingUp: double.parse(marketData.status ?? '0.0') > 0,
                  increasePer: '${BaseHelper.formatStringToDecimal(marketData.status ?? '0.0', 1)}%',
                );
              },
            ),),

            /*const SizedBoxH15(),
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
            const SizedBoxH40(),*/

          ],
        ),),
      ),
    );
  }
}
