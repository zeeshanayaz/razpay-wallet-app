import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:razpay/core/colors.dart';
import 'package:razpay/core/size_boxes.dart';
import 'package:razpay/features/transactions/presentations/widgets/filter_modal.dart';
import 'package:razpay/features/transactions/presentations/widgets/trans_tile.dart';
import 'package:razpay/theme.dart';
import 'package:provider/provider.dart';

import '../../../../core/dialog.dart';
import '../../../../core/helper.dart';
import '../../controllers/transaction_controller.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  final transactionController = Get.put(TransactionController());

  @override
  void dispose() {
    Get.delete<TransactionController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<ThemeProvider>(context, listen: true).isDark;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Portfolio Transaction',
        ),
        leading: const SizedBoxW15(),
        leadingWidth: 15,
        actions: [
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                showDragHandle: true,
                isScrollControlled: true,
                builder: (context) {
                  return const FilterModal();
                },
              );
            },
            child: const Icon(
              IconlyBold.filter,
              color: primary,
            ),
          ),
          const SizedBoxW15(),
        ],
      ),
      body: Obx(
        () => transactionController.isLoading.isTrue
            ? DialogHelper.loadingIndicator()
            : ListView.builder(
                itemCount: transactionController.transaction.length,
                itemBuilder: (context, index) {
                  var transactionData =
                      transactionController.transaction[index];
                  return TransactionTile(
                    id: transactionData.id!,
                    asset: transactionData.coinId ?? '',
                    val: '${transactionData.amount ?? 0.0}',
                    isDark: isDark,
                    status: (transactionData.category ?? '').toLowerCase() == 'receive'
                        ? 'Confirmed'
                        : 'Sent',
                    date: BaseHelper.formatDate(
                        transactionData.createdAt ?? '', 'd MMMM, y'),
                  );
                },
              ),
      ),
    );
  }
}
