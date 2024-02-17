import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/colors.dart';
import '../../../../core/helper.dart';
import '../../../../models/general/general_response.dart';
import '../../../../network/api_routes.dart';
import '../../../../network/base_client.dart';
import '../../../../network/base_controller.dart';
import '../../../../router.dart';

class CreatePinController extends GetxController {
  TextEditingController pin = TextEditingController();
  TextEditingController confirmPin = TextEditingController();

  createPin() async {

    if(pin.text != confirmPin.text) {
      BaseHelper.showSnackBar('The confirm pin field must match new pin.', color: red);
      return;
    }

    BaseController.showLoading('Creating pin...');
    var response = await BaseClient().post(ApiRoutes.updatePin, {
      'pin': pin.text,
      'type': 'new'
    }).catchError(BaseController.handleError);

    if (response == null) return;
    BaseController.hideLoading();
    if(kDebugMode) print(response);

    var createPinResponse = generalResponseFromJson(response);
    // await SharedPref.setBool(kLoggedUser, true);
    BaseHelper.showSnackBar(createPinResponse.message);
    Get.offAllNamed(AppRoutes.kycInfo);
  }
}