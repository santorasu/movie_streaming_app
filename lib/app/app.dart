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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF18122B)),
        useMaterial3: true,
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: Colors.black,
      ),
      onGenerateRoute: AppRoutes.routes,
      initialBinding: ControllerBinder(),
    );
  }
}
