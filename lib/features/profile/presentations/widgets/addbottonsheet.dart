import 'package:flutter/material.dart';
import 'package:razpay/core/button.dart';
import 'package:razpay/core/colors.dart';
import 'package:razpay/core/size_boxes.dart';
import 'package:razpay/core/style.dart';
import 'package:razpay/theme.dart';
import 'package:provider/provider.dart';

class AddModalBottonSheet extends StatefulWidget {
  const AddModalBottonSheet({super.key});

  @override
  State<AddModalBottonSheet> createState() => _AddModalBottonSheetState();
}

class _AddModalBottonSheetState extends State<AddModalBottonSheet> {
  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<ThemeProvider>(context, listen: true).isDark;
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBoxH30(),
            Text(
              'Deleting your account is an irreversibleaction that will result in the permanent loss of all data associated with it.This includes, but is not limited to, your profile information, saved preferences, and browsing history.',
              style: textStyle16.copyWith(fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
            const SizedBoxH30(),
            CustomButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              text: 'Proceed',
            ),
            const SizedBoxH20(),
            CustomButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              bgColor: primary.withOpacity(0.1),
              text: 'Cancel',
              textColor: isDark ? white : black,
            ),
          ],
        ),
      ),
    );
  }
}
