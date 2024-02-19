import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:razpay/theme.dart';
import 'package:provider/provider.dart';
import 'package:razpay/router.dart';

import 'firebase/firebase_api.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  ///Init firebase api class for all the notifications related logics
  await FirebaseApi().initNotifications();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(builder: (context, theme, _) {
        return ScreenUtilInit(
          splitScreenMode: false,
          builder: (context, child) => GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'razpay',
            theme: theme.isDark ? darkTheme : lightTheme,
            // theme: darkTheme,
            initialRoute: AppRoutes.splash,
            getPages: appRouter,
          ),
        );
      }),
    );
  }
}
