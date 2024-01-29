import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:razpay/theme.dart';
import 'package:provider/provider.dart';
import 'package:razpay/router.dart';

void main() {
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
