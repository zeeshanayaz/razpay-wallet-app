import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/colors.dart';
import '../../../core/helper.dart';
import '../../../core/utils/validator.dart';
import '../../../models/general/general_response.dart';
import '../../../network/api_routes.dart';
import '../../../network/base_client.dart';
import '../../../network/base_controller.dart';

class ChangePasswordController extends GetxController {
  TextEditingController password = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController newCPassword = TextEditingController();

  void changePassword() async {
    String? passwordError = validatePassword(password.text);
    if(passwordError != null) {
      BaseHelper.showSnackBar(passwordError, color: red);
      return;
    }
    String? newPasswordError = validatePassword(newPassword.text);
    if(newPasswordError != null) {
      BaseHelper.showSnackBar(newPasswordError, color: red);
      return;
    }
    if(newCPassword.text.isEmpty) {
      BaseHelper.showSnackBar('Confirm password cannot be empty', color: red);
      return;
    }

    if(newPassword.text != newCPassword.text) {
      BaseHelper.showSnackBar('The confirm password field must match new password.', color: red);
      return;
    }

    BaseController.showLoading('Updating password...');
    var response = await BaseClient().post(ApiRoutes.changePassword, {
      'old_password': password.text,
      'new_password': newPassword.text,
      'confirm_password': newCPassword.text,
    }).catchError(BaseController.handleError);

    if (response == null) return;
    BaseController.hideLoading();
    if(kDebugMode) print(response);

    var changePasswordResponse = generalResponseFromJson(response);
    Get.back();
    BaseHelper.showSnackBar(changePasswordResponse.message);
  }
}