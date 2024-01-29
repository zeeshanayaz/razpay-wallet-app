import 'package:flutter/material.dart';
import 'package:razpay/core/colors.dart';
import 'package:razpay/core/size_boxes.dart';
import 'package:razpay/core/style.dart';
import 'package:razpay/theme.dart';
import 'package:provider/provider.dart';

class NotificationDetail extends StatefulWidget {
  const NotificationDetail({super.key});

  @override
  State<NotificationDetail> createState() => _NotificationDetailState();
}

class _NotificationDetailState extends State<NotificationDetail> {
  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<ThemeProvider>(context, listen: true).isDark;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Password Reset',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const SizedBoxH20(),
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: isDark ? darkGrey : grey,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      const SizedBoxH25(),
                      Text(
                        'Your password was changed, please contact support if this action was not done by you.',
                        style: textStyle14,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: -20,
                  child: Image.asset(
                    'assets/icons/noti.png',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
