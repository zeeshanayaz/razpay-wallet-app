import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:get/get.dart';

import '../../../models/notification/notification.dart';
import '../../../network/api_routes.dart';
import '../../../network/base_client.dart';
import '../../../network/base_controller.dart';

class NotificationController extends GetxController {
  var isLoading = false.obs;
  var badgeCount = 0.obs;
  var notification = <Notification>[].obs;

  @override
  void onInit() {
    retrieveNotifications();
    super.onInit();
  }

  retrieveNotifications([bool? readNotification]) async {
    isLoading(true);
    var response = await BaseClient().get(ApiRoutes.notifications)
        .catchError(BaseController.handleError);

    if (response == null) return;
    isLoading(false);
    if(kDebugMode) print(response);

    notification(notificationResponseFromJson(response).notifications);
    badgeCount(notificationResponseFromJson(response).unseen);
    if(readNotification ?? false) seenNotification();
  }

  seenNotification() async {
    var response = await BaseClient().get(ApiRoutes.notificationsSeen)
        .catchError(BaseController.handleError);

    if (response == null) return;
    if(kDebugMode) print(response);

    badgeCount(0);

    // var seenResponse = generalResponseFromJson(response);
    // BaseHelper.showSnackBar(seenResponse.message);
  }

}