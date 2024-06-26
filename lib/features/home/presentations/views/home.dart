import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;
import 'package:iconsax/iconsax.dart';
import 'package:razpay/core/colors.dart';
import 'package:razpay/core/size_boxes.dart';
import 'package:razpay/core/style.dart';
import 'package:razpay/core/utils/device.dart';
import 'package:razpay/features/home/presentations/widgets/balance_card.dart';
import 'package:razpay/features/home/presentations/widgets/trending_tile.dart';
import 'package:razpay/router.dart';
import 'package:razpay/theme.dart';
import 'package:provider/provider.dart';

import '../../../../core/dialog.dart';
import '../../../notifications/controllers/notification_controller.dart';
import '../../controller/graph_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final graphController = Get.put(GraphController());
  // final trendingController = Get.put(TrendingController());
  final notificationController = Get.find<NotificationController>();

  @override
  void dispose() {
    Get.delete<GraphController>();
    // Get.delete<TrendingController>();
    // Get.delete<NotificationController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<ThemeProvider>(context, listen: true).isDark;
    return Scaffold(
      backgroundColor: isDark ? darkbgColor : white.withOpacity(.25),
      appBar: PreferredSize(
        preferredSize: Size(width(context), 40),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Razpay',
                      style: headerStyle.copyWith(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.notifications);
                  },
                  child: badges.Badge(
                    badgeContent: Obx(
                      () => Text('${notificationController.badgeCount.value}'),
                    ),
                    child: const Icon(
                      Iconsax.notification,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Obx(
        () => RefreshIndicator(
          onRefresh: () => graphController.retrieveGraph(),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BalanceCard(),
                const SizedBoxH30(),
                // Container(decoration: BoxDecoration(),),
                Image.asset(
                  'assets/images/promo.png',
                  width: width(context),
                ),
                const SizedBoxH15(),
                /* Text(
                'My Portofolios',
                style: textStyle16.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),*/
                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   padding: const EdgeInsets.symmetric(
                //     vertical: 20,
                //     horizontal: 10,
                //   ),
                //   child: Row(
                //     children: [
                //       PortfolioCard(
                //         icon: 'btc',
                //         title: 'BTC',
                //         isDark: isDark,
                //       ),
                //       const SizedBoxW20(),
                //       PortfolioCard(
                //         icon: 'eth',
                //         title: 'ETH',
                //         isDark: isDark,
                //       ),
                //     ],
                //   ),
                // ),
                // Text(
                //   'Trending',
                //   style: textStyle16.copyWith(
                //     fontWeight: FontWeight.w500,
                //   ),
                // ),
                Text(
                  'My Portofolios',
                  style: textStyle16.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBoxH15(),
                Expanded(
                  child: graphController.isLoading.isTrue
                      ? DialogHelper.loadingIndicator()
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            PortTile(
                              name: 'Bitcoin',
                              asset: 'BTC',
                              icon: 'btc',
                              value: graphController.graph.value.btcUsd ?? 0.0,
                              goingUp: true,
                              increasePer: graphController.graph.value.btcStatus ?? 0.0,
                              color: '',
                            ),
                            PortTile(
                              name: 'Ethereum',
                              asset: 'ETH',
                              icon: 'eth',
                              value: graphController.graph.value.ethUsd ?? 0.0,
                              goingUp: true,
                              increasePer: graphController.graph.value.ethStatus ?? 0.0,
                              color: '',
                            ),
                            PortTile(
                              name: 'USDT',
                              asset: 'USDT',
                              icon: 'usdt',
                              value: graphController.graph.value.usdtUsd ?? 0.0,
                              goingUp: true,
                              increasePer: graphController.graph.value.usdtStatus ?? 0.0,
                              color: '',
                            ),
                          ],
                        ),
                ),
                /*graphController.isLoadingWallet.isTrue
                  ? DialogHelper.loadingIndicator()
                  : ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: graphController.wallet.length,
                itemBuilder: (context, index) {
                  return PortTile(
                    trendingData: graphController.wallet[index],
                    name: 'Bitcoin',
                    asset: 'BTC',
                    icon: 'btc',
                    value: '\$20,000',
                    goingUp: true,
                    increasePer: '2.6%',
                    color: '',
                  );
                },
              ),*/
                /*
              const SizedBoxH5(),
              LineDivider(
                isDark: isDark,
              ),
              const SizedBoxH5(),
              const PortTile(
                name: 'Ethereum',
                asset: 'ETH',
                icon: 'eth',
                value: '\$20,000',
                goingUp: true,
                increasePer: '2.6%',
                color: 'yellow',
              ),
              const SizedBoxH5(),
              LineDivider(
                isDark: isDark,
              ),
              const SizedBoxH5(),
              const PortTile(
                name: 'Litecoin',
                asset: 'LTC',
                icon: 'ltc',
                value: '\$20,000',
                goingUp: false,
                increasePer: '2.6%',
                color: 'green',
              ),
              const SizedBoxH5(),
              LineDivider(
                isDark: isDark,
              ),
              const SizedBoxH5(),
              const PortTile(
                name: 'Binance',
                asset: 'BNB',
                icon: 'binance',
                value: '\$20,000',
                goingUp: true,
                increasePer: '2.6%',
                color: 'green',
              ),
              const SizedBoxH5(),
              LineDivider(
                isDark: isDark,
              ),
              const SizedBoxH5(),
              const PortTile(
                name: 'Ethereum',
                asset: 'ETH',
                icon: 'eth',
                value: '\$20,000',
                goingUp: true,
                increasePer: '2.6%',
                color: 'yellow',
              ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
