import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:razpay/core/colors.dart';
import 'package:razpay/core/size_boxes.dart';
import 'package:razpay/core/style.dart';
import 'package:razpay/router.dart';

class TransactionTile extends StatelessWidget {
  final int id;
  final bool isDark;
  final String asset;
  final String val;
  final String date;
  final String status;
  const TransactionTile({
    super.key,
    required this.id,
    required this.asset,
    required this.val,
    required this.isDark,
    required this.date,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          AppRoutes.transactionDetails,
          arguments: {
            'transactionId': id,
          },
        );
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
                status == 'Receive'
                    ? Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          color: green,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          IconlyBold.arrow_down_square,
                          color: white,
                        ),
                      )
                    : Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          color: red,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          IconlyBold.arrow_down_square,
                          color: white,
                        ),
                      ),
                const SizedBoxW15(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      asset,
                      style: textStyle16.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      val,
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
                Text(
                  status,
                  style: textStyle12.copyWith(
                    fontWeight: FontWeight.w700,
                    color: status == 'Receive' ? green : red,
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
