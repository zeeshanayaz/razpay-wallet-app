import 'dart:convert';

import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/dialog.dart';
import '../../../../network/app_exceptions.dart';
import '../../../../network/base_client.dart';
import '../../../../network/base_controller.dart';

class LoginController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void login() async {

    if(email.text.isEmpty || password.text.isEmpty) return;

    BaseController.showLoading('Verifying user...');
    var response = await BaseClient().post('login', {
      'email': 'emmypongaim@gmail.com',
      'password': 'password'
    }).catchError((error) {
      if (error is BadRequestException) {
        var apiError = json.decode(error.message!);
        DialogHelper.showErrorDialog(description: apiError['reason']);
      } else {
        BaseController.handleError(error);
      }
    });

    if (response == null) return;
    if(kDebugMode) print(response);
  }
}