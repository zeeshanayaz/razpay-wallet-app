import 'package:flutter/material.dart';
import 'package:razpay/features/notifications/presentations/widgets/notification_tile.dart';
import 'package:razpay/theme.dart';
import 'package:provider/provider.dart';

class NotificationScreens extends StatefulWidget {
  const NotificationScreens({super.key});

  @override
  State<NotificationScreens> createState() => _NotificationScreensState();
}

class _NotificationScreensState extends State<NotificationScreens> {
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
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            NotificationTile(
              title: 'Password Reset',
              subTitle: 'Your password was changed',
              isDark: isDark,
              date: '17 Dec, 2023',
            ),
          ],
        ),
      ),
    );
  }
}
