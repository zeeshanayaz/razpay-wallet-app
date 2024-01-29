import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:razpay/core/colors.dart';
import 'package:razpay/core/size_boxes.dart';
import 'package:razpay/features/transactions/presentations/widgets/filter_modal.dart';
import 'package:razpay/features/transactions/presentations/widgets/trans_tile.dart';
import 'package:razpay/theme.dart';
import 'package:provider/provider.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TransactionTile(
                asset: 'BTC',
                val: '0.03242',
                isDark: isDark,
                status: 'Confirmed',
                date: '17 Dec, 2023',
              ),
              TransactionTile(
                asset: 'BTC',
                val: '0.03242',
                isDark: isDark,
                status: 'Sent',
                date: '17 Dec, 2023',
              ),
              TransactionTile(
                asset: 'BTC',
                val: '0.03242',
                isDark: isDark,
                status: 'Confirmed',
                date: '17 Dec, 2023',
              ),
              TransactionTile(
                asset: 'BTC',
                val: '0.03242',
                isDark: isDark,
                status: 'Sent',
                date: '17 Dec, 2023',
              ),
              TransactionTile(
                asset: 'BTC',
                val: '0.03242',
                isDark: isDark,
                status: 'Confirmed',
                date: '17 Dec, 2023',
              ),
              TransactionTile(
                asset: 'BTC',
                val: '0.03242',
                isDark: isDark,
                status: 'Sent',
                date: '17 Dec, 2023',
              ),
              TransactionTile(
                asset: 'BTC',
                val: '0.03242',
                isDark: isDark,
                status: 'Sent',
                date: '17 Dec, 2023',
              ),
              TransactionTile(
                asset: 'BTC',
                val: '0.03242',
                isDark: isDark,
                status: 'Sent',
                date: '17 Dec, 2023',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
