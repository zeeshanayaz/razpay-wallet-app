import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razpay/core/button.dart';
import 'package:razpay/core/colors.dart';
import 'package:razpay/core/size_boxes.dart';
import 'package:razpay/core/style.dart';
import 'package:razpay/theme.dart';
import 'package:provider/provider.dart';

import '../../controller/profile_controller.dart';

class AddModalButtonSheet extends StatefulWidget {
  const AddModalButtonSheet({super.key});

  @override
  State<AddModalButtonSheet> createState() => _AddModalButtonSheetState();
}

class _AddModalButtonSheetState extends State<AddModalButtonSheet> {
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
                // Navigator.of(context).pop();
                Get.find<ProfileController>().deleteAccount();
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
