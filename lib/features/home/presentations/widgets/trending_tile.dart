import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:razpay/core/colors.dart';
import 'package:razpay/core/size_boxes.dart';
import 'package:razpay/core/style.dart';

import '../../../../core/divider.dart';
import '../../../../core/helper.dart';
import '../../../../models/trending/trending.dart';
import '../../../../theme.dart';

class TrendingTile extends StatelessWidget {
  final String icon;
  final String name;
  final String asset;
  final String value;
  final String increasePer;
  final bool goingUp;
  const TrendingTile({
    super.key,
    required this.name,
    required this.asset,
    required this.icon,
    required this.value,
    required this.goingUp,
    required this.increasePer,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<ThemeProvider>(context, listen: true).isDark;

    return Column(
      children: [
        const SizedBoxH15(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20.0,
                  backgroundImage: NetworkImage(icon),
                  backgroundColor: Colors.transparent,
                ),
                /*SvgPicture.asset(
                  'assets/icons/$icon.svg',
                ),*/
                const SizedBoxW10(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: textStyle14.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      asset.toUpperCase(),
                      style: textStyle12,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Image.asset(
                  goingUp
                      ? 'assets/icons/green-wave.png'
                      : 'assets/icons/red-wave.png',
                ),
                const SizedBoxW20(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      value,
                      style: textStyle14.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      increasePer,
                      style: textStyle12.copyWith(
                        color: goingUp ? green : red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        const SizedBoxH5(),
        LineDivider(
          isDark: isDark,
        ),
      ],
    );
  }
}

class PortTile extends StatelessWidget {
  final Trending trendingData;
  final String icon;
  final String name;
  final String asset;
  final String value;
  final String increasePer;
  final bool goingUp;
  final String color;
  const PortTile({
    super.key,
    required this.trendingData,
    required this.name,
    required this.asset,
    required this.icon,
    required this.value,
    required this.goingUp,
    required this.increasePer,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<ThemeProvider>(context, listen: true).isDark;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20.0,
                  backgroundImage: NetworkImage(trendingData.icon ?? ''),
                  backgroundColor: Colors.transparent,
                ),
                const SizedBoxW10(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      trendingData.currency ?? '',
                      style: textStyle14.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      trendingData.currency ?? '',
                      style: textStyle12,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Image.asset(
                  color == 'green'
                      ? 'assets/images/wave-green.png'
                      : color == 'yellow'
                          ? 'assets/images/wave-yellow.png'
                          : 'assets/images/wave-blue.png',
                ),
                const SizedBoxW20(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\$${BaseHelper.formatStringToDecimal(trendingData.usdValue ?? '0.0', 1)}',
                      style: textStyle14.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      BaseHelper.formatStringToDecimal(trendingData.status ?? '0.0', 1),
                      style: textStyle12.copyWith(
                        color: goingUp ? green : red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        const SizedBoxH5(),
        LineDivider(
          isDark: isDark,
        ),
        const SizedBoxH5(),
      ],
    );
  }
}
