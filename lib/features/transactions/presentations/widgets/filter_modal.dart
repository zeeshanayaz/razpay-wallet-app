import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razpay/core/button.dart';
import 'package:razpay/core/colors.dart';
import 'package:razpay/core/size_boxes.dart';
import 'package:razpay/core/style.dart';

import '../../controllers/transaction_controller.dart';

class FilterModal extends StatefulWidget {
  const FilterModal({super.key});

  @override
  State<FilterModal> createState() => _FilterModalState();
}

class _FilterModalState extends State<FilterModal> {
  final transactionController = Get.find<TransactionController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomButton(
              onPressed: () {
                transactionController.curBtc(true);
                transactionController.curEth(true);
                transactionController.curUsdt(true);
                transactionController.typeSent(true);
                transactionController.typeReceive(true);
                transactionController.filterTransactionList();
              },
              text: 'Check All',
            ),
            const SizedBoxH20(),
            Text(
              'CURRENCY TYPE',
              style: textStyle14,
            ),
            const SizedBoxH15(),
            CheckboxListTile(
              value: transactionController.curBtc.value,
              onChanged: (value) {
                transactionController.curBtc(value);
                transactionController.filterTransactionList();
              },
              activeColor: primary,
              checkColor: white,
              contentPadding: const EdgeInsets.all(0),
              title: Text(
                'BITCOIN',
                style: textStyle14.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            CheckboxListTile(
              value: transactionController.curEth.value,
              onChanged: (value) {
                transactionController.curEth(value);
                transactionController.filterTransactionList();
              },
              activeColor: primary,
              checkColor: white,
              contentPadding: const EdgeInsets.all(0),
              title: Text(
                'ETHEREUM',
                style: textStyle14.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            CheckboxListTile(
              value: transactionController.curUsdt.value,
              onChanged: (value) {
                transactionController.curUsdt(value);
                transactionController.filterTransactionList();
              },
              activeColor: primary,
              checkColor: white,
              contentPadding: const EdgeInsets.all(0),
              title: Text(
                'USDT (TRC20)',
                style: textStyle14.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBoxH20(),
            Text(
              'TRANSACTION TYPE',
              style: textStyle14,
            ),
            const SizedBoxH15(),
            CheckboxListTile(
              value: transactionController.typeSent.value,
              onChanged: (value) {
                transactionController.typeSent(value);
                transactionController.filterTransactionList();
              },
              activeColor: primary,
              checkColor: white,
              contentPadding: const EdgeInsets.all(0),
              title: Text(
                'SENT',
                style: textStyle14.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            CheckboxListTile(
              value: transactionController.typeReceive.value,
              onChanged: (value) {
                transactionController.typeReceive(value);
                transactionController.filterTransactionList();
              },
              activeColor: primary,
              checkColor: white,
              contentPadding: const EdgeInsets.all(0),
              title: Text(
                'RECEIVE',
                style: textStyle14.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBoxH20(),
          ],
        ),
      ),
    );
  }
}
