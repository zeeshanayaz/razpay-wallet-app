import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:get/get.dart';

import '../../../models/notification/notification.dart';
import '../../../network/api_routes.dart';
import '../../../network/base_client.dart';
import '../../../network/base_controller.dart';

class NotificationController extends GetxController {
  var isLoading = false.obs;
  var notification = <Notification>[].obs;

  @override
  void onInit() {
    retrieveNotifications();
    super.onInit();
  }

  retrieveNotifications() async {
    isLoading(true);
    var response = await BaseClient().get(ApiRoutes.notifications)
        .catchError(BaseController.handleError);

    if (response == null) return;
    isLoading(false);
    if(kDebugMode) print(response);

    notification(notificationResponseFromJson(response).notifications);
    seenNotification();
  }

  seenNotification() async {
    var response = await BaseClient().get(ApiRoutes.notificationsSeen)
        .catchError(BaseController.handleError);

    if (response == null) return;
    if(kDebugMode) print(response);

    // var seenResponse = generalResponseFromJson(response);
    // BaseHelper.showSnackBar(seenResponse.message);
  }

}