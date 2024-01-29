import 'package:flutter/material.dart';
import 'package:razpay/core/button.dart';
import 'package:razpay/core/colors.dart';
import 'package:razpay/core/size_boxes.dart';
import 'package:razpay/core/style.dart';

class FilterModal extends StatefulWidget {
  const FilterModal({super.key});

  @override
  State<FilterModal> createState() => _FilterModalState();
}

class _FilterModalState extends State<FilterModal> {
  bool curBtc = true;
  bool curEth = true;
  bool curUsdt = true;

  bool typeBtc = true;
  bool typeEth = true;
  bool typeUsdt = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomButton(
            onPressed: () {},
            text: 'Check All',
          ),
          const SizedBoxH20(),
          Text(
            'CURRENCY TYPE',
            style: textStyle14,
          ),
          const SizedBoxH15(),
          CheckboxListTile(
            value: curBtc,
            onChanged: (value) {
              setState(() {
                curBtc = value!;
              });
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
            value: curEth,
            onChanged: (value) {
              setState(() {
                curEth = value!;
              });
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
            value: curUsdt,
            onChanged: (value) {
              setState(() {
                curUsdt = value!;
              });
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
            value: typeBtc,
            onChanged: (value) {
              setState(() {
                typeBtc = value!;
              });
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
            value: typeEth,
            onChanged: (value) {
              setState(() {
                typeEth = value!;
              });
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
          const SizedBoxH20(),
        ],
      ),
    );
  }
}
