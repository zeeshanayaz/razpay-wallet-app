import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razpay/core/colors.dart';
import 'package:razpay/core/size_boxes.dart';
import 'package:razpay/core/style.dart';
import 'package:razpay/router.dart';

class NotificationTile extends StatelessWidget {
  final bool isDark;
  final String title;
  final String subTitle;
  final String date;
  const NotificationTile({
    super.key,
    required this.title,
    required this.subTitle,
    required this.isDark,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.notificationDetails);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: isDark ? darkGrey : grey,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset('assets/icons/noti.png'),
                const SizedBoxW15(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: textStyle16.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      subTitle,
                      style: textStyle14.copyWith(),
                    ),
                  ],
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  date,
                  style: textStyle12.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Icon(
                  Icons.star,
                  color: green,
                  size: 12,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
