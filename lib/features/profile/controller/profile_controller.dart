import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:get/get.dart';

import '../../../core/constant.dart';
import '../../../core/helper.dart';
import '../../../core/utils/shared_pref.dart';
import '../../../models/general/general_response.dart';
import '../../../models/profile/profile.dart';
import '../../../network/api_routes.dart';
import '../../../network/base_client.dart';
import '../../../network/base_controller.dart';
import '../../../router.dart';

class ProfileController extends GetxController {
  var isLoadingProfile = false.obs;
  var profileData = Profile().obs;


  @override
  void onInit() {
    retrieveProfileData();
    super.onInit();
  }

  retrieveProfileData() async {
    isLoadingProfile(true);
    var response = await BaseClient().get(ApiRoutes.profile)
        .catchError(BaseController.handleError);

    if (response == null) return;
    isLoadingProfile(false);
    if(kDebugMode) print(response);

    profileData(profileResponseFromJson(response).profile);
  }

  void logout() async {
    BaseController.showLoading('Logging out...');
    var response = await BaseClient().post(ApiRoutes.logout)
        .catchError(BaseController.handleError);

    if (response == null) return;
    BaseController.hideLoading();
    if(kDebugMode) print(response);

    var logoutResponse = generalResponseFromJson(response);
    await SharedPref.deletePrefs(kToken);
    await SharedPref.deletePrefs(kLoggedUser);
    Get.deleteAll();
    BaseHelper.showSnackBar(logoutResponse.message);
    Get.offAllNamed(AppRoutes.onboarding);
  }

  void deleteAccount() async {
    BaseController.showLoading('Deleting account...');
    var response = await BaseClient().get(ApiRoutes.delete)
        .catchError(BaseController.handleError);

    if (response == null) return;
    BaseController.hideLoading();
    if(kDebugMode) print(response);

    var logoutResponse = generalResponseFromJson(response);
    await SharedPref.deletePrefs(kToken);
    await SharedPref.deletePrefs(kLoggedUser);
    Get.deleteAll();
    BaseHelper.showSnackBar(logoutResponse.message);
    Get.offAllNamed(AppRoutes.onboarding);
  }
}