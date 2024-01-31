import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:get/get.dart';

import '../../../core/constant.dart';
import '../../../core/helper.dart';
import '../../../core/utils/shared_pref.dart';
import '../../../models/general/general_response.dart';
import '../../../network/api_routes.dart';
import '../../../network/base_client.dart';
import '../../../network/base_controller.dart';
import '../../../router.dart';

class ProfileController extends GetxController {


  void logout() async {
    BaseController.showLoading('Logging out...');
    var response = await BaseClient().post(ApiRoutes.logout)
        .catchError(BaseController.handleError);

    if (response == null) return;
    BaseController.hideLoading();
    if(kDebugMode) print(response);

    var profileResponse = generalResponseFromJson(response);
    await SharedPref.deletePrefs(kToken);
    await SharedPref.deletePrefs(kLoggedUser);
    Get.deleteAll();
    BaseHelper.showSnackBar(profileResponse.message);
    Get.offAllNamed(AppRoutes.onboarding);
  }

}