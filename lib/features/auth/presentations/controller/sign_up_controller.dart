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

class SignUpController extends GetxController {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController country = TextEditingController();
  var agreed = false.obs;

  register() async {

    if(firstName.text.isEmpty || lastName.text.isEmpty) {
      BaseHelper.showSnackBar('The first and last name field is required.', color: red);
      return;
    }

    String? emailError = emailValidator(email.text);
    if(emailError != null) {
      BaseHelper.showSnackBar(emailError, color: red);
      return;
    }

    String? passwordError = validatePassword(password.text);
    if(passwordError != null) {
      BaseHelper.showSnackBar(passwordError, color: red);
      return;
    }

    if(country.text.isEmpty) {
      BaseHelper.showSnackBar('The country field is required.', color: red);
      return;
    }

    if(agreed.isFalse) {
      BaseHelper.showSnackBar('Please review the terms and condition.', color: red);
      return;
    }

    BaseController.showLoading();
    var response = await BaseClient().post(ApiRoutes.register, {
      'first_name': firstName.text,
      'last_name': lastName.text,
      'email': email.text,
      'password': password.text,
      'country': country.text
    }).catchError(BaseController.handleError);

    if (response == null) return;
    BaseController.hideLoading();
    if(kDebugMode) print(response);

    var profileResponse = profileResponseFromJson(response);
    await SharedPref.setString(kToken, profileResponse.profile?.token ?? '');
    BaseHelper.showSnackBar(profileResponse.message);
    Get.offAllNamed(AppRoutes.createPin);
  }
}