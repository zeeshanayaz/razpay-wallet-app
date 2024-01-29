import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'package:get/get.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Icon(
        Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
        size: 20,
      ),
    );
  }
}
