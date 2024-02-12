import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:iconsax/iconsax.dart';
import 'package:razpay/core/colors.dart';
import 'package:razpay/core/size_boxes.dart';
import 'package:razpay/core/style.dart';
import 'package:razpay/core/utils/device.dart';
import 'package:razpay/features/home/presentations/widgets/receive_crypto.dart';
import 'package:razpay/router.dart';
import 'package:razpay/theme.dart';
import 'package:provider/provider.dart';

import '../../controller/graph_controller.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    final graphController = Get.find<GraphController>();

    bool isDark = Provider.of<ThemeProvider>(context, listen: true).isDark;
    return Obx(() => Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(25),
          height: height(context) * .2,
          decoration: BoxDecoration(
            color: primary,
            borderRadius: BorderRadius.circular(15),
            image: const DecorationImage(
              image: AssetImage('assets/images/port-bg.png'),
              alignment: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'My Portofolio',
                        style: textStyle14.copyWith(color: white),
                      ),
                      Text(
                        '\$${graphController.graph.value.total ?? 0.0}',
                        style: headerStyle.copyWith(color: white),
                      ),
                      // const SizedBoxH15(),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: const Color(0xffDFF1FF),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              IconlyBold.arrow_up_2,
                              color: green,
                            ),
                            Text(
                              '${graphController.graph.value.status ?? 0.0}%',
                              style: textStyle12.copyWith(
                                color: green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(
                        Iconsax.chart,
                        color: white,
                      ),
                      SizedBoxH20(),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          bottom: -15,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              actionButton(
                title: 'Receive',
                icon: 'receive',
                isDark: isDark,
                onPress: () {
                  showModalBottomSheet(
                    context: context,
                    showDragHandle: true,
                    isScrollControlled: true,
                    // backgroundColor: isDark ? darkbgColor : white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    builder: (context) {
                      return const ReceiveCryptoModal();
                    },
                  );
                },
              ),
              const SizedBoxW20(),
              actionButton(
                title: 'Send',
                icon: 'send',
                isDark: isDark,
                onPress: () {
                  Get.toNamed(AppRoutes.sendCrypto);
                },
              ),
            ],
          ),
        ),
      ],
    ),);
  }

  Widget actionButton({
    required String title,
    required String icon,
    required Function() onPress,
    required bool isDark,
  }) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.all(10),
        width: 120,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            if (!isDark)
              const BoxShadow(
                offset: Offset(1, 5),
                color: grey,
                blurRadius: 2,
                spreadRadius: 0,
              ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/icons/$icon.svg'),
            const SizedBoxW10(),
            Text(
              title,
              style: textStyle16.copyWith(
                fontWeight: FontWeight.bold,
                color: black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
