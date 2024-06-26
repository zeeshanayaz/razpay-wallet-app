
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/colors.dart';
import '../../../../core/helper.dart';
import '../../../../core/utils/validator.dart';
import '../../../../models/general/general_response.dart';
import '../../../../network/api_routes.dart';
import '../../../../network/base_client.dart';
import '../../../../network/base_controller.dart';
import '../../../../router.dart';

class ForgetPasswordController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController pin = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cpassword = TextEditingController();

  void sendOtpForgetPassword() async {
    String? emailError = emailValidator(email.text);
    if(emailError != null) {
      BaseHelper.showSnackBar(emailError, color: red);
      return;
    }

    BaseController.showLoading('Verifying user...');
    var response = await BaseClient().post(ApiRoutes.sendOtp, {
      'email': email.text,
    }).catchError(BaseController.handleError);

    if (response == null) return;
    BaseController.hideLoading();
    if(kDebugMode) print(response);

    var sendOtpResponse = generalResponseFromJson(response);
    BaseHelper.showSnackBar(sendOtpResponse.message);
    Get.toNamed(AppRoutes.forgotPasswordVerification);
  }

  void resetPassword() async {
    String? passwordError = validatePassword(password.text);
    if(passwordError != null) {
      BaseHelper.showSnackBar(passwordError, color: red);
      return;
    }
    if(cpassword.text.isEmpty) {
      BaseHelper.showSnackBar('Confirm password cannot be empty', color: red);
      return;
    }

    if(password.text != cpassword.text) {
      BaseHelper.showSnackBar('The confirm password field must match new password.', color: red);
      return;
    }

    BaseController.showLoading('Updating password...');
    var response = await BaseClient().post(ApiRoutes.resetPassword, {
      'email': email.text,
      'otp': pin.text,
      'password': password.text,
    }).catchError(BaseController.handleError);

    if (response == null) return;
    BaseController.hideLoading();
    if(kDebugMode) print(response);

    var resetPasswordResponse = generalResponseFromJson(response);
    BaseHelper.showSnackBar(resetPasswordResponse.message);
    Get.offAllNamed(AppRoutes.login);
  }
}