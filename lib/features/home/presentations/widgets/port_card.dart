import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:razpay/core/colors.dart';
import 'package:razpay/core/size_boxes.dart';
import 'package:razpay/core/style.dart';

class PortfolioCard extends StatelessWidget {
  final String icon;
  final String title;
  final bool isDark;
  const PortfolioCard({
    super.key,
    required this.icon,
    required this.title,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 208,
      padding: const EdgeInsets.all(20),
      height: 168,
      decoration: BoxDecoration(
        color: isDark ? darkGrey : white,
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage('assets/icons/$icon-bg.png'),
          fit: BoxFit.fitHeight,
          opacity: isDark ? .1 : 1,
          alignment: Alignment.bottomRight,
        ),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset('assets/icons/$icon.svg'),
              const SizedBoxW10(),
              Text(
                title,
                style: textStyle14.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '/USD',
                style: textStyle14.copyWith(
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Portofolio',
                    style: textStyle12,
                  ),
                  Text(
                    '\$19,654',
                    style: textStyle18.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.arrow_drop_up,
                    color: green,
                  ),
                  Text(
                    '+10%',
                    style: textStyle12.copyWith(
                      color: green,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
