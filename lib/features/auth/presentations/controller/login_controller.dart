import 'dart:convert';

import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/dialog.dart';
import '../../../../core/utils/validator.dart';
import '../../../../network/app_exceptions.dart';
import '../../../../network/base_client.dart';
import '../../../../network/base_controller.dart';

class LoginController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void login() async {

    // if(email.text.isEmpty || password.text.isEmpty) return;
    String? emailError = emailValidator(email.text);
    if(emailError != null) {
      DialogHelper.showSnackBar(title: 'Error', message: emailError);
      return;
    }
    if(password.text.isEmpty) {
      DialogHelper.showSnackBar(title: 'Error', message: 'Password cannot be empty');
      return;
    }

    BaseController.showLoading('Verifying user...');
    var response = await BaseClient().post('login', {
      'email': email.text,
      'password': password.text
    }).catchError(BaseController.handleError);

    if (response == null) return;
    if(kDebugMode) print(response);
  }
}