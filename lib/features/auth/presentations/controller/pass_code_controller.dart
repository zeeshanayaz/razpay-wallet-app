import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant.dart';
import '../../../../core/helper.dart';
import '../../../../core/utils/shared_pref.dart';
import '../../../../models/profile/profile.dart';
import '../../../../network/api_routes.dart';
import '../../../../network/base_client.dart';
import '../../../../network/base_controller.dart';
import '../../../../router.dart';

class PasscodeLoginController extends GetxController {
  TextEditingController pin = TextEditingController();

  void loginWithPassCode() async {

    if(pin.text.isEmpty && pin.text.length < 4) {
      return;
    }

    BaseController.showLoading('Verifying pin...');
    var response = await BaseClient().post(ApiRoutes.pinLogin, {
      'pin': pin.text
    }).catchError(BaseController.handleError);

    if (response == null) return;
    BaseController.hideLoading();
    if(kDebugMode) print(response);

    var profileResponse = profileResponseFromJson(response);
    await SharedPref.setBool(kLoggedUser, true);
    BaseHelper.showSnackBar(profileResponse.message);
    Get.offAllNamed(AppRoutes.mainHome);
  }
}