import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razpay/core/button.dart';
import 'package:razpay/core/size_boxes.dart';
import 'package:razpay/core/style.dart';
import 'package:razpay/core/text_field.dart';
import 'package:razpay/router.dart';
// import 'package:razpay/theme.dart';
// import 'package:provider/provider.dart';

class KYCPersonalInformation extends StatefulWidget {
  const KYCPersonalInformation({super.key});

  @override
  State<KYCPersonalInformation> createState() => _KYCPersonalInformationState();
}

class _KYCPersonalInformationState extends State<KYCPersonalInformation> {
  @override
  Widget build(BuildContext context) {
    // bool isDark = Provider.of<ThemeProvider>(context, listen: true).isDark;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Personal Information',
                      style: headerStyle.copyWith(fontSize: 24),
                    ),
                    Text(
                      'This data should match your documents.',
                      style: textStyle14,
                    ),
                    const SizedBoxH20(),
                    CustomTextField(
                      controller: TextEditingController(),
                      hintText: 'First name',
                    ),
                    const SizedBoxH15(),
                    CustomTextField(
                      controller: TextEditingController(),
                      hintText: 'Last name',
                    ),
                    const SizedBoxH15(),
                    CustomTextField(
                      controller: TextEditingController(),
                      hintText: 'City',
                    ),
                    const SizedBoxH15(),
                    CustomTextField(
                      controller: TextEditingController(),
                      hintText: 'Phone Number',
                    ),
                    const SizedBoxH15(),
                    CustomTextField(
                      controller: TextEditingController(),
                      hintText: 'Country',
                      suffixIcon: Icon(
                        Icons.keyboard_arrow_down,
                      ),
                    ),
                    const SizedBoxH15(),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                CustomButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.kycChooseDoc);
                  },
                  text: 'Next Step',
                ),
                const SizedBoxH20(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
