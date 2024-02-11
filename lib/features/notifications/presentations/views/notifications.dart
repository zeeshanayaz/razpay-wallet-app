import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razpay/features/notifications/presentations/widgets/notification_tile.dart';
import 'package:razpay/theme.dart';
import 'package:provider/provider.dart';

import '../../../../core/dialog.dart';
import '../../../../core/helper.dart';
import '../../controllers/notification_controller.dart';

class NotificationScreens extends StatefulWidget {
  const NotificationScreens({super.key});

  @override
  State<NotificationScreens> createState() => _NotificationScreensState();
}

class _NotificationScreensState extends State<NotificationScreens> {
  final notificationController = Get.put(NotificationController());

  @override
  void dispose() {
    Get.delete<NotificationController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<ThemeProvider>(context, listen: true).isDark;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Notifications',
        ),
      ),
      body: Obx(
        () => notificationController.isLoading.isTrue
            ? DialogHelper.loadingIndicator()
            : ListView.builder(
              itemCount: notificationController.notification.length,
              itemBuilder: (context, index) {
                var notificationData = notificationController.notification[index];
                return NotificationTile(
                  notification: notificationData,
                  title: notificationData.title ?? '',
                  subTitle: notificationData.description ?? '',
                  isDark: isDark,
                  date: BaseHelper.formatDate(notificationData.createdAt ?? '', 'd MMMM, y h:mma'),
                );
              },
            ),
      ),
    );
  }
}
