import 'package:flutter/material.dart';
import 'package:razpay/core/colors.dart';
import 'package:razpay/core/style.dart';

class MarketCapWid extends StatelessWidget {
  final String title;
  final String price;
  final String rate;
  final bool increasing;
  const MarketCapWid({
    super.key,
    required this.title,
    required this.price,
    required this.rate,
    required this.increasing,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textStyle14,
        ),
        Text(
          price,
          style: headerStyle.copyWith(fontSize: 20),
        ),
        Text(
          rate,
          style: textStyle14.copyWith(
            color: increasing ? green : red,
          ),
        ),
      ],
    );
  }
}
