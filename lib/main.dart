import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'OnBoard/FirstScreen.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true, // Set to false in production to disable device preview
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          useInheritedMediaQuery: true, // Ensures DevicePreview works
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(), // You can set your theme here
          builder: DevicePreview.appBuilder, // Wraps the MaterialApp in DevicePreview builder
          home: child, // Start with the FirstScreen
        );
      },
      child: const FirstScreen(), // This is your app's first screen
    );
  }
}
