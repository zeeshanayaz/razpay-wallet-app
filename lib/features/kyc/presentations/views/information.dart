import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razpay/core/button.dart';
import 'package:razpay/core/size_boxes.dart';
import 'package:razpay/core/style.dart';
import 'package:razpay/core/text_field.dart';

import '../../controllers/kyc_controller.dart';
// import 'package:razpay/theme.dart';
// import 'package:provider/provider.dart';

class KYCPersonalInformation extends StatefulWidget {
  const KYCPersonalInformation({super.key});

  @override
  State<KYCPersonalInformation> createState() => _KYCPersonalInformationState();
}

class _KYCPersonalInformationState extends State<KYCPersonalInformation> {
  final kycInformationController = Get.put(KYCInformationController());

  @override
  void dispose() {
    Get.delete<KYCInformationController>();
    super.dispose();
  }

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
                      controller: kycInformationController.firstName,
                      hintText: 'First name',
                      textCapitalization: TextCapitalization.words,
                    ),
                    const SizedBoxH15(),
                    CustomTextField(
                      controller: kycInformationController.lastName,
                      hintText: 'Last name',
                      textCapitalization: TextCapitalization.words,
                    ),
                    const SizedBoxH15(),
                    CustomTextField(
                      controller: kycInformationController.city,
                      hintText: 'City',
                      textCapitalization: TextCapitalization.words,
                    ),
                    const SizedBoxH15(),
                    CustomTextField(
                      controller: kycInformationController.phoneNumber,
                      hintText: 'Phone Number',
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBoxH15(),
                    CustomTextField(
                      controller: kycInformationController.country,
                      hintText: 'Country',
                      suffixIcon: const Icon(
                        Icons.keyboard_arrow_down,
                      ),
                      textCapitalization: TextCapitalization.words,
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
                    kycInformationController.navigateToKycChooseDoc();
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
