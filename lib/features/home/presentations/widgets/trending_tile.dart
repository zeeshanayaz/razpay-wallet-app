import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:razpay/core/colors.dart';
import 'package:razpay/core/size_boxes.dart';
import 'package:razpay/core/style.dart';

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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              'assets/icons/$icon.svg',
            ),
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
                  asset,
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
    );
  }
}

class PortTile extends StatelessWidget {
  final String icon;
  final String name;
  final String asset;
  final String value;
  final String increasePer;
  final bool goingUp;
  final String color;
  const PortTile({
    super.key,
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              'assets/icons/$icon.svg',
            ),
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
                  asset,
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
    );
  }
}
