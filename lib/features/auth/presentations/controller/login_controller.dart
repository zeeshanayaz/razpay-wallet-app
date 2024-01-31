
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/colors.dart';
import '../../../../core/constant.dart';
import '../../../../core/helper.dart';
import '../../../../core/utils/shared_pref.dart';
import '../../../../core/utils/validator.dart';
import '../../../../models/profile/profile.dart';
import '../../../../network/api_routes.dart';
import '../../../../network/base_client.dart';
import '../../../../network/base_controller.dart';
import '../../../../router.dart';

class LoginController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void login() async {

    // if(email.text.isEmpty || password.text.isEmpty) return;
    String? emailError = emailValidator(email.text);
    if(emailError != null) {
      BaseHelper.showSnackBar(emailError, color: red);
      return;
    }
    if(password.text.isEmpty) {
      BaseHelper.showSnackBar('Password cannot be empty', color: red);
      return;
    }

    BaseController.showLoading('Verifying user...');
    var response = await BaseClient().post(ApiRoutes.login, {
      'email': email.text,
      'password': password.text
    }).catchError(BaseController.handleError);

    if (response == null) return;
    BaseController.hideLoading();
    if(kDebugMode) print(response);

    var profileResponse = profileResponseFromJson(response);
    await SharedPref.setString(kToken, profileResponse.profile?.token ?? '');
    BaseHelper.showSnackBar(profileResponse.message);
    Get.offAllNamed(AppRoutes.passcode);
  }
}