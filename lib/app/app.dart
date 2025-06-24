import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_streaming_app/app/app_routes.dart';
import 'package:movie_streaming_app/app/app_theme.dart';
import 'package:movie_streaming_app/app/controller_binder.dart';
import 'package:movie_streaming_app/features/auth/ui/screens/splash_screen.dart';

class MovieStreamingApp extends StatelessWidget {
  const MovieStreamingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.name,
      theme: AppTheme.lightTheme,
      onGenerateRoute: AppRoutes.routes,
      initialBinding: ControllerBinder(),
    );
  }
}
