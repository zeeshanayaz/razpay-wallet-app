// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:razpay/core/colors.dart';
import 'package:razpay/core/size_boxes.dart';
import 'package:razpay/core/style.dart';
import 'package:razpay/theme.dart';
import 'package:provider/provider.dart';

class ProfileLinkTile extends StatelessWidget {
  final IconData iconData;
  final String text;
  final bool icon;
  const ProfileLinkTile({
    super.key,
    required this.iconData,
    required this.text,
    this.icon = true,
    bool iswitchValue = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: white.withOpacity(.1),
              child: Icon(
                iconData,
                color: primary,
              ),
            ),
            const SizedBoxW10(),
            Text(
              text,
              style: textStyle14.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
        icon
            ? Icon(
                Icons.arrow_forward_ios,
                size: 20,
              )
            : Consumer<ThemeProvider>(builder: (context, model, _) {
                return Switch(
                  value: model.isDark,
                  onChanged: (val) {
                    model.toggleTheme();
                  },
                );
              })
      ],
    );
  }
}
