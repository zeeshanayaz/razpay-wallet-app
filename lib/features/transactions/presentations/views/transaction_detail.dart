import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:razpay/core/button.dart';
import 'package:razpay/core/colors.dart';
import 'package:razpay/core/divider.dart';
import 'package:razpay/core/size_boxes.dart';
import 'package:razpay/core/style.dart';

import 'package:razpay/theme.dart';
import 'package:provider/provider.dart';

import '../../../../core/constant.dart';
import '../../../../core/dialog.dart';
import '../../../../core/helper.dart';
import '../../controllers/transaction_controller.dart';

class TransactionDetail extends StatefulWidget {
  const TransactionDetail({super.key});

  @override
  State<TransactionDetail> createState() => _TransactionDetailState();
}

class _TransactionDetailState extends State<TransactionDetail> {
  final transactionController = Get.find<TransactionController>();

  @override
  void initState() {
    final Map<String, dynamic> args = Get.arguments;
    final int transactionId = args['transactionId'];
    transactionController.getSingleTransactionDetail(transactionId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<ThemeProvider>(context, listen: true).isDark;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Transaction Details',
        ),
      ),
      body: Obx(
        () => transactionController.isLoadingTransactionDetail.isTrue
            ? DialogHelper.loadingIndicator()
            : Padding(
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
                            color: isDark ? darkGrey : white,
                            borderRadius: BorderRadius.circular(15),
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
                            children: [
                              const SizedBoxH25(),
                              assetDetail(isDark),
                              const SizedBoxH10(),
                              LineDivider(
                                isDark: isDark,
                              ),
                              const SizedBoxH10(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Withdrawal Fee',
                                    style: textStyle14,
                                  ),
                                  Text(
                                    '${transactionController.transactionDetail.value.fees} ${transactionController.transactionDetail.value.coinId}',
                                    style: textStyle14.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBoxH10(),
                              LineDivider(
                                isDark: isDark,
                              ),
                              const SizedBoxH10(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Status',
                                    style: textStyle14,
                                  ),
                                  Text(
                                    (transactionController.transactionDetail
                                                    .value.confirmations ??
                                                0) ==
                                            1
                                        ? 'Confirmed'
                                        : 'Sent',
                                    style: textStyle14.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: (transactionController
                                                      .transactionDetail
                                                      .value
                                                      .confirmations ??
                                                  0) ==
                                              1
                                          ? green
                                          : red,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBoxH10(),
                              LineDivider(
                                isDark: isDark,
                              ),
                              const SizedBoxH10(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Timestamp',
                                    style: textStyle14,
                                  ),
                                  Text(
                                    BaseHelper.formatDate(
                                        transactionController.transactionDetail
                                                .value.createdAt ??
                                            '',
                                        'd MMMM, y\nh:mma'),
                                    style: textStyle14.copyWith(
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBoxH10(),
                              LineDivider(
                                isDark: isDark,
                              ),
                              const SizedBoxH10(),
                              Text(
                                'Recipient Address',
                                style: textStyle16.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBoxH5(),
                              Text(
                                transactionController
                                        .transactionDetail.value.address ??
                                    '',
                                style: textStyle14,
                              ),
                              const SizedBoxH15(),
                              Text(
                                'Transaction ID',
                                style: textStyle16.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBoxH5(),
                              Text(
                                transactionController
                                        .transactionDetail.value.tnxid ??
                                    '',
                                style: textStyle14,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: -20,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: (transactionController.transactionDetail
                                              .value.confirmations ??
                                          0) ==
                                      1
                                  ? green
                                  : red,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              IconlyBold.arrow_down_square,
                              color: white,
                            ),
                          ),
                          // child: Image.asset(
                          //   'assets/icons/confirmed.png',
                          // ),
                        ),
                      ],
                    ),
                    const SizedBoxH25(),
                    CustomButton(
                      onPressed: () {
                        // Get.offAndToNamed(AppRoutes.mainHome);
                        Get.back();
                      },
                      text: 'Back to Portfolio',
                    )
                  ],
                ),
              ),
      ),
    );
  }

  Widget assetDetail(bool isDark) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: isDark ? grey.withOpacity(.2) : grey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(
                accessCryptoIcon(transactionController.transactionDetail.value.coinId ?? ''),
                width: 30,
                height: 30,
              ),
            ),
            const SizedBoxW10(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  accessCryptoName(transactionController.transactionDetail.value.coinId ?? ''),
                  style: textStyle16.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  transactionController.transactionDetail.value.coinId ?? '',
                  style: textStyle12,
                ),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '\$${transactionController.transactionDetail.value.amount}',
              style: textStyle16.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${transactionController.transactionDetail.value.newBalance} ${transactionController.transactionDetail.value.coinId}',
              style: textStyle12,
            ),
          ],
        ),
      ],
    );
  }
}
