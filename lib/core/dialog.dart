import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'size_boxes.dart';
import 'style.dart';

class DialogHelper {
  //show error dialog
  static void showErrorDialog({String title = 'Error', String? description = 'Something went wrong'}) {
    Get.dialog(
      AlertDialog.adaptive(
        content: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: textStyle16.copyWith(fontWeight: FontWeight.w500,),
              ),
              Text(
                description ?? '',
                style: textStyle14,
              ),
              ElevatedButton(
                onPressed: () {
                  if (Get.isDialogOpen!) Get.back();
                },
                child: const Text('Okay'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //show toast
  //show snack bar
  //show loading
  static void showLoading([String? message]) {
    Get.dialog(
      AlertDialog.adaptive(
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator.adaptive(),
              const SizedBoxH10(),
              Text(message ?? 'Loading...'),
            ],
          ),
        ),
      ),
        barrierDismissible: false,
    );
  }

  //hide loading
  static void hideLoading() {
    if (Get.isDialogOpen!) Get.back();
  }
}