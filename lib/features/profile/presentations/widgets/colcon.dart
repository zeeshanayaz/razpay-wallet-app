// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:razpay/core/colors.dart';
import 'package:razpay/core/size_boxes.dart';
import 'package:razpay/core/style.dart';

class Container2 extends StatelessWidget {
  final String avatar;
  final String text;
  final String text2;
  const Container2(
      {super.key,
      required this.avatar,
      required this.text,
      required this.text2});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: primary,
          child: SvgPicture.asset(avatar),
        ),
        SizedBoxW10(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: textStyle12.copyWith(),
            ),
            Text(
              text2,
              style: textStyle18.copyWith(
                  fontSize: 20, fontWeight: FontWeight.w800),
            ),
          ],
        )
      ],
    );
  }
}
